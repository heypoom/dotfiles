// @orca-managed-pi-extension
// Why: no package-specific type import here. Pi and OMP expose the same
// extension API, but publish their types under different package names.
// Why: warn-once so a recurring parse error on a malformed endpoint
// file does not spam stderr inside the pi TUI on every event.
let warnedBadEndpoint = false
// Why: Pi awaits extension handlers. Status delivery stays off that
// critical path, and the latest-only pending slot prevents a stalled
// Orca receiver from building an unbounded queue of obsolete snapshots.
const HOOK_POST_TIMEOUT_MS = 1000
let activePost = false
let pendingPost: { hookEventName: string; extra: Record<string, unknown>; metadata: Record<string, unknown>; ompRuntime: boolean } | null = null
let sessionMetadata: Record<string, unknown> = {}

function updateSessionMetadata(ctx: unknown): void {
  const sessionManager = (ctx as { sessionManager?: { getSessionId?: () => unknown; getSessionFile?: () => unknown } } | null)?.sessionManager
  const sessionId = sessionManager?.getSessionId?.()
  const sessionFile = sessionManager?.getSessionFile?.()
  sessionMetadata = typeof sessionId === 'string' && sessionId && typeof sessionFile === 'string' && sessionFile ? { session_id: sessionId } : {}
}

function updateRuntimeOmpSessionMetadata(ctx: unknown): void {
  updateSessionMetadata(ctx)
}

function getPostSessionMetadata(_ompRuntime: boolean): Record<string, unknown> {
  return sessionMetadata
}


// Why: re-reading the endpoint file on every event is cheap (small file,
// rare changes) but stat+mtime caching avoids re-parsing on every event
// during streaming tool execution. Mirrors the OpenCode plugin cache shape.
let cachedEndpointKey = ''
let cachedEndpointValues: Record<string, string> | null = null

function readEndpointFile(): Record<string, string> | null {
  const path = process.env.ORCA_AGENT_HOOK_ENDPOINT
  if (!path) return null
  try {
    const fs = require('fs')
    try {
      const stat = fs.statSync(path)
      const cacheKey = stat.mtimeMs + ':' + stat.size + ':' + stat.ino
      if (cacheKey === cachedEndpointKey && cachedEndpointValues) {
        return cachedEndpointValues
      }
      const contents: string = fs.readFileSync(path, 'utf8')
      const out: Record<string, string> = {}
      for (const line of contents.split(/\r?\n/)) {
        // Why: parse `KEY=VALUE` (POSIX endpoint.env) and `set KEY=VALUE`
        // (Windows endpoint.cmd) with one regex; strip a trailing CR so
        // mixed-EOL files do not leak \r into the value.
        const m = line.match(/^(?:set\s+)?([A-Z0-9_]+)=(.*)$/)
        if (m) out[m[1]] = m[2].replace(/\r$/, '')
      }
      cachedEndpointKey = cacheKey
      cachedEndpointValues = out
      return out
    } catch (ioErr) {
      cachedEndpointKey = ''
      cachedEndpointValues = null
      throw ioErr
    }
  } catch (err: unknown) {
    const code = (err as { code?: string } | null)?.code
    if (err && code !== 'ENOENT' && !warnedBadEndpoint) {
      warnedBadEndpoint = true
      console.warn('[orca-pi-status] failed to parse endpoint file:', (err as Error).message)
    }
    return null
  }
}

function resolveHookCoords() {
  const fileEnv = readEndpointFile() || {}
  return {
    port: fileEnv.ORCA_AGENT_HOOK_PORT || process.env.ORCA_AGENT_HOOK_PORT,
    token: fileEnv.ORCA_AGENT_HOOK_TOKEN || process.env.ORCA_AGENT_HOOK_TOKEN,
    env: fileEnv.ORCA_AGENT_HOOK_ENV || process.env.ORCA_AGENT_HOOK_ENV || '',
    version: fileEnv.ORCA_AGENT_HOOK_VERSION || process.env.ORCA_AGENT_HOOK_VERSION || '',
  }
}

function processName(value: unknown): string {
  return String(value || '').split(/[\\/]/).pop()?.toLowerCase() || ''
}

const CONFIGURED_HOOK_PATH = '/hook/omp'
let cachedOmpRuntime: boolean | null = null

function isOmpRuntime(): boolean {
  if (cachedOmpRuntime !== null) return cachedOmpRuntime
  if (CONFIGURED_HOOK_PATH === '/hook/omp') {
    cachedOmpRuntime = true
    return true
  }
  const executableNames = [
    processName(process.title),
    processName(process.env._),
    processName(process.argv[1]),
    processName(process.argv[0])
  ]
  cachedOmpRuntime = executableNames.some((name) =>
    ['omp', 'omp.js', 'omp.sh', 'omp.cmd', 'omp.exe', 'omp.bat'].includes(name)
  )
  return cachedOmpRuntime
}

function resolveHookPath(ompRuntime: boolean): string {
  // Why: runtime detection keeps a bare-shell OMP launch from reporting as Pi.
  if (ompRuntime) return '/hook/omp'
  return CONFIGURED_HOOK_PATH
}

function post(hookEventName: string, extra: Record<string, unknown> = {}): void {
  const ompRuntime = isOmpRuntime()
  pendingPost = {
    hookEventName,
    extra,
    metadata: getPostSessionMetadata(ompRuntime),
    ompRuntime,
  }
  drainPosts()
}

function drainPosts(): void {
  if (activePost || !pendingPost) return
  const next = pendingPost
  pendingPost = null
  activePost = true
  void postOnce(next.hookEventName, next.extra, next.metadata, next.ompRuntime)
    .catch(() => {})
    .finally(() => {
      activePost = false
      drainPosts()
    })
}

async function postOnce(
  hookEventName: string,
  extra: Record<string, unknown>,
  metadata: Record<string, unknown>,
  ompRuntime: boolean
): Promise<void> {
  const coords = resolveHookCoords()
  const paneKey = process.env.ORCA_PANE_KEY
  if (!coords.port || !coords.token || !paneKey) return
  const url = `http://127.0.0.1:${coords.port}${resolveHookPath(ompRuntime)}`
  const body = JSON.stringify({
    paneKey,
    launchToken: process.env.ORCA_AGENT_LAUNCH_TOKEN || '',
    tabId: process.env.ORCA_TAB_ID || '',
    worktreeId: process.env.ORCA_WORKTREE_ID || '',
    env: coords.env,
    version: coords.version,
    payload: { hook_event_name: hookEventName, ...metadata, ...extra },
  })
  const controller = typeof AbortController !== 'undefined' ? new AbortController() : null
  let timeout: ReturnType<typeof setTimeout> | undefined
  const timeoutPromise = new Promise<never>((_resolve, reject) => {
    timeout = setTimeout(() => {
      controller?.abort()
      reject(new Error('Orca hook delivery timed out'))
    }, HOOK_POST_TIMEOUT_MS)
    if (typeof timeout.unref === 'function') timeout.unref()
  })
  try {
    await Promise.race([
      fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Orca-Agent-Hook-Token': coords.token,
        },
        body,
        ...(controller ? { signal: controller.signal } : {}),
      }),
      timeoutPromise,
    ])
  } catch {
    // Why: status reporting must never fail the pi run just because Orca
    // is unavailable or the loopback request failed (e.g. Orca restart).
    if (!isWslRuntime()) return
    postViaWindowsCurl(body, ompRuntime)
  } finally {
    if (timeout) clearTimeout(timeout)
  }
}

// Why: WSL-ness and curl.exe presence cannot change within a process
// lifetime; re-probing /proc and /mnt/c on every failed event would add
// filesystem work to the per-event path.
let cachedIsWslRuntime: boolean | null = null
let cachedWindowsCurlPath: string | null | undefined

function isWslRuntime(): boolean {
  if (cachedIsWslRuntime !== null) return cachedIsWslRuntime
  cachedIsWslRuntime = detectWslRuntime()
  return cachedIsWslRuntime
}

function detectWslRuntime(): boolean {
  if (process.env.WSL_DISTRO_NAME) return true
  try {
    const fs = require('fs')
    for (const path of ['/proc/sys/kernel/osrelease', '/proc/version']) {
      try {
        const contents = String(fs.readFileSync(path, 'utf8'))
        if (/microsoft|wsl/i.test(contents)) return true
      } catch {
        // Why: probe the next runtime hint when a proc file is absent or unreadable.
      }
    }
  } catch {
    return false
  }
  return false
}

function resolveWindowsCurlPath(): string | null {
  if (cachedWindowsCurlPath !== undefined) return cachedWindowsCurlPath
  try {
    const fs = require('fs')
    const curlPath = '/mnt/c/Windows/System32/curl.exe'
    cachedWindowsCurlPath = fs.existsSync(curlPath) ? curlPath : null
  } catch {
    cachedWindowsCurlPath = null
  }
  return cachedWindowsCurlPath
}

// Why: WSL loopback is not the Windows loopback, so use curl.exe on the host.
function postViaWindowsCurl(body: string, ompRuntime: boolean): void {
  const curlPath = resolveWindowsCurlPath()
  const windowsPort = process.env.ORCA_AGENT_HOOK_PORT
  const windowsToken = process.env.ORCA_AGENT_HOOK_TOKEN
  if (!curlPath || !windowsPort || !windowsToken) return
  // Why: a stale guest endpoint must fall back to current host coordinates.
  const windowsUrl = `http://127.0.0.1:${windowsPort}${resolveHookPath(ompRuntime)}`
  try {
    const { spawn } = require('child_process')
    const child = spawn(
      curlPath,
      [
        '-sS',
        // Why: detached delivery may take seconds under loaded WSL interop.
        '--connect-timeout', '3',
        '--max-time', '10',
        '--noproxy', '127.0.0.1',
        '-o', 'NUL',
        '-X', 'POST',
        '-H', 'Content-Type: application/json',
        '-H', `X-Orca-Agent-Hook-Token: ${windowsToken}`,
        '--data-binary', '@-',
        windowsUrl
      ],
      { stdio: ['pipe', 'ignore', 'ignore'] }
    )
    child.on('error', () => {})
    child.stdin.on('error', () => {})
    child.stdin.end(body)
  } catch {
    // Why: status delivery must not surface inside the agent TUI.
  }
}

// Why: pi assistant messages carry content as an array of parts
// ({ type: 'text', text } / tool_use / tool_result / reasoning). We only
// surface the concatenated text parts as the visible 'last assistant
// message' for the dashboard preview — tool_use / reasoning would be
// noise (the dashboard already shows the active tool name + input).
function extractAssistantText(message: unknown): string {
  if (!message || typeof message !== 'object') return ''
  const content = (message as { content?: unknown }).content
  if (typeof content === 'string') return content
  if (!Array.isArray(content)) return ''
  let out = ''
  for (const part of content) {
    if (part && typeof part === 'object' && (part as { type?: unknown }).type === 'text') {
      const text = (part as { text?: unknown }).text
      if (typeof text === 'string') out += text
    }
  }
  return out
}

// Why: pi's tool_call event input shape is tool-specific (event.input is
// the raw args object). The agent-hooks server already runs
// deriveToolInputPreview(toolName, input) to render a friendly preview
// for known tool names ('bash' → command, 'read'/'write'/'edit' → path,
// etc.), so we forward the raw object verbatim under the same field
// names Claude uses (tool_name / tool_input) and let the server pick the
// preview. Keeps tool-name knowledge centralized on the receiver side.
// Why: child agents inherit the lead's pane env; only its process may
// register status hooks. PID identity keeps in-process reloads reporting.
export default function (pi): void {
  const ownerPid = process.env.ORCA_PI_STATUS_OWNED
  const selfPid = String(process.pid)
  if (ownerPid && ownerPid !== selfPid) return
  process.env.ORCA_PI_STATUS_OWNED = selfPid
  pi.on('before_agent_start', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    post('before_agent_start', { prompt: event.prompt ?? '' })
  })

  pi.on('agent_start', (_event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    clearPendingAgentEndCheck()
    agentEndReported = false
    post('agent_start')
  })

  pi.on('tool_execution_start', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    post('tool_execution_start', {
      tool_name: event.toolName,
      tool_input: event.args,
    })
  })

  pi.on('tool_call', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    post('tool_call', {
      tool_name: event.toolName,
      tool_input: event.input,
    })
  })

  pi.on('tool_execution_end', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    post('tool_execution_end', {
      tool_name: event.toolName,
    })
  })

  pi.on('tool_approval_requested', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    if (!isOmpRuntime()) return
    post('tool_approval_requested', {
      tool_name: event.toolName,
      reason: event.reason,
      approval_mode: event.approvalMode,
    })
  })

  pi.on('tool_approval_resolved', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    if (!isOmpRuntime()) return
    post('tool_approval_resolved', {
      tool_name: event.toolName,
      approved: event.approved,
    })
  })

  // Why: capture the assistant's final text on each completed message
  // so the dashboard preview reflects the most recent reply even before
  // agent_end fires. message_end is the right hook because pi guarantees
  // it fires after the message is finalized (post-streaming).
  pi.on('message_end', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    if (event.message?.role !== 'assistant') return
    const text = extractAssistantText(event.message)
    if (!text) return
    post('message_end', { role: 'assistant', text })
  })

  // Why: modern Pi stays non-idle across retry/compaction/follow-up work,
  // while legacy Pi becomes idle after its final agent_end handlers.
  // OMP instead marks non-terminal agent_end events with willContinue, so it
  // returns before the recheck timer is ever armed.
  const AGENT_END_IDLE_RECHECK_MS = 25
  const AGENT_END_IDLE_RECHECK_MAX_MS = 250
  let agentSettledSupported = false
  let agentEndReported = false
  let agentEndIdleRecheckMs = AGENT_END_IDLE_RECHECK_MS
  let pendingAgentEndCheck: ReturnType<typeof setTimeout> | null = null
  let pendingAgentEndContext: { isIdle: () => boolean } | null = null

  function clearPendingAgentEndCheck(): void {
    if (pendingAgentEndCheck !== null) clearTimeout(pendingAgentEndCheck)
    pendingAgentEndCheck = null
    pendingAgentEndContext = null
  }

  // Why: isIdle flips before agent_settled handlers run, so both paths
  // share a per-run guard instead of racing duplicate completion posts.
  function postAgentEndOnce(): void {
    if (agentEndReported) return
    agentEndReported = true
    post('agent_end')
  }

  function checkPendingAgentEnd(): void {
    pendingAgentEndCheck = null
    const ctx = pendingAgentEndContext
    if (!ctx || agentSettledSupported || agentEndReported) {
      pendingAgentEndContext = null
      return
    }
    try {
      if (ctx.isIdle()) {
        pendingAgentEndContext = null
        postAgentEndOnce()
        return
      }
    } catch {
      pendingAgentEndContext = null
      return
    }
    pendingAgentEndCheck = setTimeout(checkPendingAgentEnd, agentEndIdleRecheckMs)
    if (typeof pendingAgentEndCheck.unref === 'function') pendingAgentEndCheck.unref()
    agentEndIdleRecheckMs = Math.min(agentEndIdleRecheckMs * 2, AGENT_END_IDLE_RECHECK_MAX_MS)
  }

  pi.on('agent_settled', (_event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    agentSettledSupported = true
    clearPendingAgentEndCheck()
    postAgentEndOnce()
  })

  pi.on('agent_end', (event, ctx) => {
    updateRuntimeOmpSessionMetadata(ctx)
    if (event?.willContinue === true) {
      clearPendingAgentEndCheck()
      return
    }
    if (isOmpRuntime()) {
      postAgentEndOnce()
      return
    }
    if (agentSettledSupported) return
    if (!ctx || typeof ctx.isIdle !== 'function') {
      postAgentEndOnce()
      return
    }
    clearPendingAgentEndCheck()
    agentEndIdleRecheckMs = AGENT_END_IDLE_RECHECK_MS
    pendingAgentEndContext = ctx
    pendingAgentEndCheck = setTimeout(checkPendingAgentEnd, 0)
    if (typeof pendingAgentEndCheck.unref === 'function') pendingAgentEndCheck.unref()
  })
}
