#!/usr/bin/env bash
# Idempotent installer for a Metabase devbox on Ubuntu 24.04.
#
# Run it as the dev user (not root). That user needs passwordless sudo.
# Every step checks before it changes anything, so re-running is safe and fast.
#
# Inputs (environment variables, or KEY=value lines in $DEVBOX_ENV_FILE):
#   DOTFILES_GITHUB_USER  GitHub user for `chezmoi init`. Empty skips chezmoi.
#   DEVBOX_SHELL          Login shell: fish (default), zsh or bash.
#   METABASE_REPO_URL     Repo to clone. Empty skips the clone.
#   METABASE_PUSH_URL     Push URL set on origin (default: SSH upstream).
#   METABASE_DIR          Clone location (default ~/Workspaces/metabase/metabase).
#   TAILSCALE_AUTH_KEY    If set, install Tailscale and run `tailscale up --ssh`.
#   TAILSCALE_HOSTNAME    Tailnet hostname (default: the machine hostname).
#   SKILLS_REPO_URL       Private skills repo (SSH URL) cloned to ~/.agents/skills,
#                         linked as ~/.claude/skills. Needs GitHub SSH access, so it is
#                         skipped until bootstrap runs over `ssh -A` (make rebootstrap).
#   AGENT_PRIVATE_REPO_URL  Private agent-memory repo (SSH URL) cloned to
#                         ~/Workspaces/metabase/agent-private. Also needs `ssh -A`.
#   GITHUB_TOKEN          Optional. Raises GitHub API rate limits for mise.
# Tool versions live in versions.env next to this script.

# shellcheck source-path=SCRIPTDIR
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEVBOX_ENV_FILE="${DEVBOX_ENV_FILE:-/opt/devbox/devbox.env}"

if [[ -r "$DEVBOX_ENV_FILE" ]]; then
  # Variables the caller exported win over the file (e.g. make rebootstrap).
  caller_env="$(export -p)"
  set -a
  # shellcheck source=/dev/null
  source "$DEVBOX_ENV_FILE"
  set +a
  eval "$caller_env"
  unset caller_env
fi

if [[ ! -r "$SCRIPT_DIR/versions.env" ]]; then
  echo "error: $SCRIPT_DIR/versions.env not found. Run bootstrap.sh from its folder in the repo." >&2
  exit 1
fi
# shellcheck source=versions.env
source "$SCRIPT_DIR/versions.env"

: "${DOTFILES_GITHUB_USER:=}"
: "${DEVBOX_SHELL:=fish}"
: "${METABASE_REPO_URL=https://github.com/metabase/metabase.git}"
: "${METABASE_PUSH_URL:=git@github.com:metabase/metabase.git}"
: "${METABASE_DIR:=$HOME/Workspaces/metabase/metabase}"
: "${TAILSCALE_AUTH_KEY:=}"
: "${TAILSCALE_HOSTNAME:=$(hostname)}"
: "${SKILLS_REPO_URL:=}"
: "${AGENT_PRIVATE_REPO_URL:=}"
: "${AGENT_PRIVATE_DIR:=$HOME/Workspaces/metabase/agent-private}"

USER="${USER:-$(id -un)}"
export USER
LOG_FILE="$HOME/.devbox-bootstrap.log"
export DEBIAN_FRONTEND=noninteractive
export MISE_YES=1
export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"

if [[ "$(id -u)" -eq 0 ]]; then
  echo "error: run bootstrap.sh as the dev user, not root." >&2
  exit 1
fi

exec > >(tee -a "$LOG_FILE") 2>&1

SUMMARY=()
CURRENT_STEP="start"
START_TIME=$SECONDS

log() { printf '\033[94m==>\033[0m %s\n' "$*"; }
record() { SUMMARY+=("$(printf '%-10s %s' "$1" "$CURRENT_STEP")"); }
changed() { record "changed"; }
ok() { record "ok"; }
skipped() { record "skipped"; }

on_error() {
  echo "error: step '$CURRENT_STEP' failed (line $1). See $LOG_FILE" >&2
}
trap 'on_error $LINENO' ERR

step() {
  CURRENT_STEP="$1"
  log "$1"
}

in_container() {
  [[ -f /.dockerenv ]] || grep -qa 'container=' /proc/1/environ 2>/dev/null
}

# Writes stdin to $1 with sudo, only when the content differs. Returns 0 if written.
write_root_file() {
  local target="$1" tmp
  tmp="$(mktemp)"
  cat >"$tmp"
  if sudo cmp -s "$tmp" "$target" 2>/dev/null; then
    rm -f "$tmp"
    return 1
  fi
  sudo install -m 0644 "$tmp" "$target"
  rm -f "$tmp"
}

# Same as write_root_file, for files the user owns.
write_user_file() {
  local target="$1" tmp
  tmp="$(mktemp)"
  cat >"$tmp"
  if cmp -s "$tmp" "$target" 2>/dev/null; then
    rm -f "$tmp"
    return 1
  fi
  mkdir -p "$(dirname "$target")"
  mv "$tmp" "$target"
}

APT_PACKAGES=(
  # basics
  git curl ca-certificates gnupg unzip zip xz-utils file less sudo locales tzdata
  procps openssh-client
  # dev tools
  ripgrep fd-find fzf jq tmux mosh htop entr git-lfs rlwrap fish zsh
  lnav tig ncdu dnsutils lsof pinentry-curses postgresql-client
  # libraries mise needs to build tools (python, ruby, node-gyp modules)
  build-essential pkg-config autoconf libssl-dev zlib1g-dev libffi-dev
  libreadline-dev libbz2-dev libsqlite3-dev liblzma-dev libyaml-dev libncurses-dev
)

install_apt_packages() {
  step "apt packages"
  local missing=() pkg
  for pkg in "${APT_PACKAGES[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$pkg" 2>/dev/null | grep -q 'install ok installed'; then
      missing+=("$pkg")
    fi
  done
  if ((${#missing[@]} == 0)); then
    ok
    return
  fi
  log "installing: ${missing[*]}"
  sudo apt-get update -q
  sudo apt-get install -yq --no-install-recommends "${missing[@]}"
  changed
}

install_fish4() {
  step "fish 4 (fish-shell PPA)"
  # Ubuntu 24.04 ships fish 3.7; macOS has fish 4, and plugins assume it.
  if command -v fish >/dev/null && [[ "$(fish --version)" == *"version 4."* ]]; then
    ok
    return
  fi
  if ! grep -rqs 'fish-shell/release-4' /etc/apt/sources.list.d/; then
    sudo apt-get update -q
    sudo apt-get install -yq --no-install-recommends software-properties-common
    sudo add-apt-repository -y ppa:fish-shell/release-4
  fi
  sudo apt-get update -q
  sudo apt-get install -yq fish
  changed
}

install_docker() {
  step "docker engine"
  # Docker's own apt repo: current engine plus the compose and buildx plugins.
  local did=0
  if ! command -v docker >/dev/null; then
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    # shellcheck source=/dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
      sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt-get update -q
    sudo apt-get install -yq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    did=1
  fi
  if ! id -nG "$USER" | grep -qw docker; then
    # Takes effect on the next login.
    sudo usermod -aG docker "$USER"
    did=1
  fi
  if ((did)); then changed; else ok; fi
}

install_terminfo() {
  step "terminfo (ghostty, kitty)"
  # SSH from these terminals sends TERM=xterm-ghostty / xterm-kitty, which
  # Ubuntu doesn't know. Compiled into ~/.terminfo, which ncurses searches.
  local src name did=0
  for src in "$SCRIPT_DIR"/terminfo/*.terminfo; do
    name="$(basename "$src" .terminfo)"
    infocmp "$name" >/dev/null 2>&1 && continue
    tic -x -o "$HOME/.terminfo" "$src"
    did=1
  done
  if ((did)); then changed; else ok; fi
}

link_fd() {
  step "fd symlink"
  # Ubuntu ships fd as `fdfind`. The dotfiles call `fd`.
  if [[ -x "$HOME/.local/bin/fd" ]]; then
    ok
    return
  fi
  mkdir -p "$HOME/.local/bin"
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
  changed
}

configure_locale() {
  step "locale en_US.UTF-8"
  # The dotfiles' fish config sets LC_ALL=en_US.UTF-8.
  if locale -a 2>/dev/null | grep -qi '^en_US\.utf-\?8$'; then
    ok
    return
  fi
  sudo locale-gen en_US.UTF-8
  changed
}

configure_timezone() {
  step "timezone $DEVBOX_TIMEZONE"
  local zone="/usr/share/zoneinfo/$DEVBOX_TIMEZONE"
  if [[ "$(readlink -f /etc/localtime)" == "$zone" ]]; then
    ok
    return
  fi
  sudo ln -sf "$zone" /etc/localtime
  echo "$DEVBOX_TIMEZONE" | sudo tee /etc/timezone >/dev/null
  changed
}

configure_sysctl() {
  step "sysctl (inotify, swappiness)"
  if write_root_file /etc/sysctl.d/60-devbox.conf <<EOF; then
# Managed by devbox bootstrap.sh. rspack and file watchers need many watches.
fs.inotify.max_user_watches = $DEVBOX_INOTIFY_WATCHES
fs.inotify.max_user_instances = 1024
vm.swappiness = 10
EOF
    if in_container; then
      log "container: file written, not applied"
    else
      sudo sysctl --system >/dev/null
    fi
    changed
  else
    ok
  fi
}

configure_swap() {
  step "swapfile ${DEVBOX_SWAP_GB}G"
  if in_container; then
    skipped
    return
  fi
  if swapon --show=NAME --noheadings | grep -qx /swapfile; then
    ok
    return
  fi
  if [[ ! -f /swapfile ]]; then
    sudo fallocate -l "${DEVBOX_SWAP_GB}G" /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile >/dev/null
  fi
  sudo swapon /swapfile
  grep -q '^/swapfile ' /etc/fstab || echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab >/dev/null
  changed
}

configure_login_shell() {
  step "login shell $DEVBOX_SHELL"
  local want current
  want="$(command -v "$DEVBOX_SHELL")"
  current="$(getent passwd "$USER" | cut -d: -f7)"
  if [[ "$current" == "$want" ]]; then
    ok
    return
  fi
  grep -qx "$want" /etc/shells || echo "$want" | sudo tee -a /etc/shells >/dev/null
  sudo usermod -s "$want" "$USER"
  changed
}

install_tailscale() {
  step "tailscale"
  if [[ -z "$TAILSCALE_AUTH_KEY" ]]; then
    skipped
    return
  fi
  if in_container; then
    log "container: tailscaled needs systemd, skipping"
    skipped
    return
  fi
  local did=0
  if ! command -v tailscale >/dev/null; then
    curl -fsSL https://tailscale.com/install.sh | sh
    did=1
  fi
  if [[ "$(sudo tailscale status --json 2>/dev/null | jq -r '.BackendState')" != "Running" ]]; then
    sudo tailscale up --auth-key="$TAILSCALE_AUTH_KEY" --ssh --hostname="$TAILSCALE_HOSTNAME"
    did=1
  fi
  if ((did)); then changed; else ok; fi
}

install_mise() {
  step "mise"
  if [[ -x "$HOME/.local/bin/mise" ]]; then
    ok
    return
  fi
  curl -fsSL https://mise.run | sh
  changed
}

configure_bash_mise() {
  step "mise activation in ~/.bashrc"
  # fish gets mise shims from the dotfiles (conf.d/5-mise.fish).
  # bash is still used for scripts and as a fallback shell.
  # shellcheck disable=SC2016 # written literally into .bashrc
  local line='eval "$("$HOME/.local/bin/mise" activate bash)"'
  if grep -qF "$line" "$HOME/.bashrc" 2>/dev/null; then
    ok
    return
  fi
  printf '\n# devbox: mise\n%s\n' "$line" >>"$HOME/.bashrc"
  changed
}

install_chezmoi() {
  step "chezmoi"
  if [[ -z "$DOTFILES_GITHUB_USER" ]]; then
    skipped
    return
  fi
  local did=0
  if [[ ! -x "$HOME/.local/bin/chezmoi" ]]; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    did=1
  fi
  if [[ ! -f "$HOME/.config/chezmoi/chezmoi.toml" ]]; then
    if [[ -d "$HOME/.local/share/chezmoi/.git" ]]; then
      # The repo was cloned by hand (manual bootstrap); reuse it.
      chezmoi init --apply
    else
      chezmoi init --apply "$DOTFILES_GITHUB_USER"
    fi
    did=1
  fi
  # Later runs leave dotfiles alone. Use `chezmoi update` to pull changes.
  if ((did)); then changed; else ok; fi
}

configure_mise_tools() {
  step "mise devbox tools config"
  # A conf.d fragment keeps the dotfiles' config.toml untouched.
  # config.toml still wins on any tool both files define.
  if write_user_file "$HOME/.config/mise/conf.d/devbox.toml" <"$SCRIPT_DIR/devbox-mise.toml"; then
    changed
  else
    ok
  fi
}

install_mise_tools() {
  step "mise install (global)"
  local missing
  missing="$(cd "$HOME" && mise ls --current --missing 2>/dev/null || true)"
  if [[ -z "$missing" ]]; then
    ok
    return
  fi
  (cd "$HOME" && mise install)
  changed
}

install_nvim_plugins() {
  step "neovim plugins (lazy-lock.json)"
  # The dotfiles use NVIM_APPNAME=nvchad. Restoring the lockfile now means the
  # first `nvim` opens ready, with the same plugin versions as macOS.
  local lock="$HOME/.config/nvchad/lazy-lock.json" lazy="$HOME/.local/share/nvchad/lazy"
  if [[ ! -f "$lock" ]]; then
    skipped
    return
  fi
  local want have=0
  want="$(jq 'keys | length' "$lock")"
  if [[ -d "$lazy" ]]; then
    have="$(find "$lazy" -mindepth 1 -maxdepth 1 -type d | wc -l)"
  fi
  if ((have >= want)); then
    ok
    return
  fi
  NVIM_APPNAME=nvchad nvim --headless "+Lazy! restore" +qa
  changed
}

install_claude_code() {
  step "claude code"
  if [[ -x "$HOME/.local/bin/claude" ]]; then
    ok
    return
  fi
  curl -fsSL https://claude.ai/install.sh | bash -s "$CLAUDE_CODE_VERSION"
  changed
}

install_herdr_integration() {
  step "herdr claude integration"
  if [[ -f "$HOME/.claude/hooks/herdr-agent-state.sh" ]]; then
    ok
    return
  fi
  herdr integration install claude
  changed
}

configure_claude_settings() {
  step "claude code settings"
  # Merges the committed, secret-free fragment over whatever Claude, herdr
  # and plugins already wrote, so those keys stay.
  local settings="$HOME/.claude/settings.json" merged
  mkdir -p "$HOME/.claude"
  [[ -f "$settings" ]] || echo '{}' >"$settings"
  merged="$(jq -s '.[0] * .[1]' "$settings" "$SCRIPT_DIR/claude-settings.json")"
  if jq --sort-keys . "$settings" | cmp -s - <(jq --sort-keys . <<<"$merged"); then
    ok
    return
  fi
  printf '%s\n' "$merged" >"$settings"
  changed
}

install_mcp_servers() {
  step "claude code mcp servers"
  # User-scope servers that need no secrets. Context7 works without its API key
  # (rate limited); the github server needs a token and is left out.
  local -A servers=(
    [context7]="$(jq -nc '{type: "http", url: "https://mcp.context7.com/mcp"}')"
    [sequential-thinking]="$(jq -nc '{command: "npx", args: ["-y", "@modelcontextprotocol/server-sequential-thinking"]}')"
    [git]="$(jq -nc --arg repo "$METABASE_DIR" '{command: "uvx", args: ["mcp-server-git", "--repository", $repo]}')"
    [sem]="$(jq -nc '{command: "sem", args: ["mcp"]}')"
  )
  local name did=0
  for name in "${!servers[@]}"; do
    if jq -e --arg n "$name" '.mcpServers[$n]' "$HOME/.claude.json" >/dev/null 2>&1; then
      continue
    fi
    claude mcp add-json --scope user "$name" "${servers[$name]}" >/dev/null
    did=1
  done
  if ((did)); then changed; else ok; fi
}

install_claude_plugins() {
  step "claude code plugins"
  local installed missing=() plugin repo
  installed="$(claude plugin list 2>/dev/null || true)"
  for plugin in $CLAUDE_PLUGINS; do
    grep -qF "❯ $plugin" <<<"$installed" || missing+=("$plugin")
  done
  if ((${#missing[@]} == 0)); then
    ok
    return
  fi
  local marketplaces
  marketplaces="$(claude plugin marketplace list 2>/dev/null || true)"
  for repo in $CLAUDE_PLUGIN_MARKETPLACES; do
    grep -qF "GitHub ($repo)" <<<"$marketplaces" || claude plugin marketplace add "$repo"
  done
  for plugin in "${missing[@]}"; do
    claude plugin install --scope user "$plugin"
  done
  changed
}

install_pi_packages() {
  step "pi packages"
  # The dotfiles' ~/.pi/agent/settings.json lists packages (e.g. pi-claude-code);
  # pi keeps git packages under ~/.pi/agent/git/<host>/<owner>/<repo>.
  local settings="$HOME/.pi/agent/settings.json" url did=0
  if [[ ! -f "$settings" ]] || ! command -v pi >/dev/null; then
    skipped
    return
  fi
  while IFS= read -r url; do
    [[ "$url" == https://* ]] || continue
    [[ -d "$HOME/.pi/agent/git/${url#https://}" ]] && continue
    pi install "$url"
    did=1
  done < <(jq -r '.packages[]? | if type == "string" then . else .source end' "$settings")
  if ((did)); then changed; else ok; fi
}

install_gh_extensions() {
  step "gh extensions"
  if [[ -z "$GH_EXTENSIONS" ]]; then
    skipped
    return
  fi
  if ! gh auth status >/dev/null 2>&1; then
    log "gh is not logged in; run \`gh auth login\` on the box, then make rebootstrap"
    skipped
    return
  fi
  local installed ext did=0
  installed="$(gh extension list 2>/dev/null || true)"
  for ext in $GH_EXTENSIONS; do
    if ! grep -qF "$ext" <<<"$installed"; then
      gh extension install "$ext"
      did=1
    fi
  done
  if ((did)); then changed; else ok; fi
}

clone_private_skills() {
  step "private skills"
  if [[ -z "$SKILLS_REPO_URL" ]]; then
    skipped
    return
  fi
  local did=0 skills="$HOME/.agents/skills"
  if [[ ! -d "$skills/.git" ]]; then
    # Exit code 1 plus this message means the key works (GitHub offers no shell).
    if ! ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -T git@github.com 2>&1 | grep -q 'successfully authenticated'; then
      log "no GitHub SSH access; re-run over \`ssh -A\` (make rebootstrap) to clone"
      skipped
      return
    fi
    mkdir -p "$(dirname "$skills")"
    git clone "$SKILLS_REPO_URL" "$skills"
    did=1
  fi
  if [[ "$(readlink "$HOME/.claude/skills" 2>/dev/null)" != "$skills" ]]; then
    if [[ -e "$HOME/.claude/skills" && ! -L "$HOME/.claude/skills" ]]; then
      log "$HOME/.claude/skills exists and is not a link; leaving it"
    else
      ln -sfn "$skills" "$HOME/.claude/skills"
      did=1
    fi
  fi
  if ((did)); then changed; else ok; fi
}

clone_agent_private() {
  step "agent-private notes"
  # Agent memory shared by every checkout, worktree and machine. Private, so
  # like private skills it clones only once GitHub SSH works (make rebootstrap).
  if [[ -z "$AGENT_PRIVATE_REPO_URL" ]]; then
    skipped
    return
  fi
  if [[ -d "$AGENT_PRIVATE_DIR/.git" ]]; then
    ok
    return
  fi
  if ! ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -T git@github.com 2>&1 | grep -q 'successfully authenticated'; then
    log "no GitHub SSH access; re-run over \`ssh -A\` (make rebootstrap) to clone"
    skipped
    return
  fi
  mkdir -p "$(dirname "$AGENT_PRIVATE_DIR")"
  git clone "$AGENT_PRIVATE_REPO_URL" "$AGENT_PRIVATE_DIR"
  changed
}

clone_metabase() {
  step "metabase repo"
  if [[ -z "$METABASE_REPO_URL" ]]; then
    skipped
    return
  fi
  local did=0
  if [[ ! -d "$METABASE_DIR/.git" ]]; then
    mkdir -p "$(dirname "$METABASE_DIR")"
    # Blobless clone: full history, file contents fetched on demand.
    git clone --filter=blob:none "$METABASE_REPO_URL" "$METABASE_DIR"
    did=1
  fi
  if [[ -n "$METABASE_PUSH_URL" && "$(git -C "$METABASE_DIR" remote get-url --push origin)" != "$METABASE_PUSH_URL" ]]; then
    git -C "$METABASE_DIR" remote set-url --push origin "$METABASE_PUSH_URL"
    did=1
  fi
  if ((did)); then changed; else ok; fi
}

install_metabase_toolchain() {
  step "metabase toolchain (mise install in repo)"
  if [[ -z "$METABASE_REPO_URL" ]]; then
    skipped
    return
  fi
  local did=0 missing
  # Trusting an already-trusted file is a no-op.
  mise trust --quiet "$METABASE_DIR/mise.toml"
  missing="$(cd "$METABASE_DIR" && mise ls --current --missing 2>/dev/null || true)"
  if [[ -n "$missing" ]]; then
    (cd "$METABASE_DIR" && mise install)
    did=1
  fi
  if ((did)); then changed; else ok; fi
}

print_summary() {
  CURRENT_STEP="summary"
  echo
  log "devbox bootstrap finished in $((SECONDS - START_TIME))s"
  printf '  %s\n' "${SUMMARY[@]}"
  echo "  log: $LOG_FILE"
}

main() {
  log "devbox bootstrap for $USER on $(hostname) ($(date -Is))"
  install_fish4
  install_apt_packages
  install_docker
  link_fd
  configure_locale
  configure_timezone
  configure_sysctl
  configure_swap
  configure_login_shell
  install_tailscale
  install_mise
  configure_bash_mise
  install_chezmoi
  configure_mise_tools
  install_mise_tools
  install_terminfo
  install_nvim_plugins
  install_claude_code
  install_herdr_integration
  configure_claude_settings
  install_claude_plugins
  install_mcp_servers
  install_pi_packages
  install_gh_extensions
  clone_private_skills
  clone_agent_private
  clone_metabase
  install_metabase_toolchain
  print_summary
}

main "$@"
