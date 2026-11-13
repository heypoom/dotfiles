---
name: devbox
description: Poom's remote Metabase dev server, built from `devbox/` (Terraform + cloud-init + bootstrap.sh). Use when editing anything under `devbox/`; deploying, rebuilding, destroying or SSH-ing to the devbox; handling `private.fish` or other secrets for it; or setting up the Metabase toolchain on a Linux box.
---

# devbox

Poom (he/him; works on Metabase from Bangkok, strongest in TypeScript, wants concise answers) runs a cloud VPS in Singapore as his daily dev server, over SSH, mosh and Tailscale. `make apply` builds it; destroy + apply must give the same box. The second goal is **portability**: reviews say Vultr's fraud checks sometimes suspend accounts without warning, so the box must rebuild on any provider, or by hand on any Ubuntu machine.

[`devbox/README.md`](../../../devbox/README.md) is the source of truth for layout, commands, plans and prices, what gets installed, and the smoke test. Read it before changing anything. This skill holds what the files don't say: the reasons, the gotchas, and the rules.

## Architecture (decided; keep it)

- `devbox/bootstrap/bootstrap.sh` holds all tool logic. It's idempotent, runs as the dev user, and works without Terraform. New tools go here and nowhere else.
- `devbox/modules/cloud-init` only creates the user, locks down sshd, writes bootstrap files to `/opt/devbox/`, and runs bootstrap.
- `devbox/stacks/<provider>` are thin root modules: key, firewall, instance, outputs. A new provider is one new folder.
- Every bootstrap step checks state first and records `changed`, `ok` or `skipped`. A second run must report zero `changed`. `make test-docker` enforces this.

## Secrets and `private.fish`

`~/.config/fish/private.fish` holds Poom's secrets as `set -gx NAME value` lines: `VULTR_API_KEY`, `TF_VAR_tailscale_auth_key` and other tokens. It's gitignored in this repo and listed in `.chezmoiignore`, so chezmoi never deploys it.

- **Load it per command; never print values.** Each Bash call is a fresh shell, so load what you need inside the same command:
  ```bash
  eval "$(awk '$1=="set" && $2=="-gx" && ($3=="VULTR_API_KEY" || $3=="TF_VAR_tailscale_auth_key") {print "export " $3 "=\"" $4 "\""}' ~/.config/fish/private.fish)"
  ```
  To confirm a key exists, print its name, length or prefix. When asked to add one, ask Poom to edit the file directly rather than paste the key in chat.
- **Secrets reach the box only through scp.** `make push-secrets` copies `private.fish` with mode 600. Anything in Terraform variables or `user_data` lands in plain text in `terraform.tfstate` and in the provider's metadata service. The Tailscale key is the one exception: it's single-use, and cloud-init deletes it from `/opt/devbox/devbox.env` after bootstrap.
- **The repo is public** (`heypoom/dotfiles`). Before every commit, check that `git status --ignored` shows `*.tfstate`, `*.tfplan`, `*.tfvars` and `.terraform/` as ignored, and grep the staged diff for key-shaped strings.
- Planned upgrade (not built): turn `private.fish` into a chezmoi template that reads values with `onepasswordRead` (`op` is already in the global mise config).

## Deploy, rebuild, destroy

Each step finishes on its stated condition.

1. **Dotfiles pushed.** The box runs `chezmoi init heypoom`, which pulls GitHub `main`, not this checkout. Any dotfiles change the box needs must be committed and pushed first. `devbox/` itself doesn't need pushing, because cloud-init embeds `bootstrap.sh` and `versions.env`. Done when `git status` is clean and `main` matches `origin/main`.
2. **Local checks pass.** Done when `make check` passes, and `make test-docker` passes if `bootstrap.sh` changed.
3. **Apply.** Load the keys, then run `make apply STACK=vultr`; it bills from this point. Poom approves each apply and destroy. Vultr is prepaid, so "does not have any additional credit" means Poom has to add funds. Done when `terraform output` prints the IP.
4. **Ready.** Run `make wait` (`cloud-init status --wait --long`). A failed bootstrap makes this report an error, because runcmd keeps bootstrap's exit code. Done when it prints `status: done`.
5. **Smoke test.** Run the README's smoke-test block over SSH. Done when every command succeeds. Then Poom runs `make push-secrets` and `make rebootstrap` (private skills), and `/login` in `claude` on the box.
6. **Tear down** with `make destroy STACK=vultr` when a test box is no longer needed.

## Decisions and why

- **Providers:** Vultr `vhp-4c-8gb-amd` in `sgp` first ($0.066/h, $48/mo), with Linode `g6-standard-4` in `sg-sin-2` as the fallback. Same price. 16 GB is twice the price on both.
- **Tailscale uses Poom's personal tailnet.** To reach the box while logged into another tailnet, share the machine with that identity (Machines → ⋯ → Share). Auth keys must be **one-off** and **pre-approved**, never **ephemeral**, because ephemeral nodes can disappear after a reboot. `public_ssh` stays `true` until Tailscale SSH has been confirmed working.
- **Shell is fish 4**, from the `fish-shell/release-4` PPA, because Ubuntu 24.04 ships 3.7 and macOS runs 4.x. Keep the major versions matched. GNU and BSD tools also differ: `config/dot_config/fish/functions/realpath.fish` gives GNU `realpath` the BSD behaviour with no argument, which to-fish's `to add` relies on. Look for this class of difference when a fish plugin works on the Mac but not on the box.
- **The fish config comes from the dotfiles.** mise reaches fish through shims on `PATH` (`conf.d/5-mise.fish`). bash gets `mise activate` in `.bashrc`.
- **The dotfiles' mise `config.toml` is the global source** (Java Temurin 21, Node 22, Python, Bun, Rust, …) and is shared with macOS. Devbox-only CLIs (the Linux stand-ins for Poom's Homebrew tools) are pinned in `devbox/bootstrap/devbox-mise.toml`, which bootstrap copies to `~/.config/mise/conf.d/devbox.toml`. That way the shared config stays untouched. A new tool goes there when mise has it, and into bootstrap's `APT_PACKAGES` otherwise. The list was chosen from his fish abbreviations (`conf.d/2-abbreviations.fish`), his shell history, `setup/macos/Brewfile` and `gh extension list`. Recheck those when he says a tool is missing.
- **The dotfiles assume some tools exist:** the gitconfig pager is `diff-so-fancy`, fish sets `RUSTC_WRAPPER=sccache`, `ls`/`l`/`tree` are abbreviations for `eza`, and the `gs`/`gsp`/`usr`/`restack` abbreviations need the `gh stack` extension. Removing any of these from the box breaks his shell or git.
- **Parity with the Mac.** Poom wants the box to feel almost identical to his Mac. Check new work against that.
  - Every file under `devbox/bootstrap/` ships to `/opt/devbox/bootstrap/`, through cloud-init (`fileset`) and `make rebootstrap` (tar over SSH). Keep the rendered user data under 64 KB; Linode measures it after base64, and it's about 41 KB today.
  - The tide prompt lives in fish universal variables, and chezmoi ignores `fish_variables`. So `config/.chezmoiscripts/run_onchange_after_1_tide-config.sh` sets the Mac's `tide_*` values and then runs `_tide_remove_unusable_items`. After `tide configure` on the Mac, regenerate it with the command in its header.
  - The gitconfig template uses `osxkeychain` on macOS and `gh auth git-credential` on Linux.
  - Claude Code settings: only secret-free, portable keys go in `bootstrap/claude-settings.json`. The Mac's hooks (Orca, `osascript`, `send-hook-event`), `statusLine` and `keybindings.json` (an Orca binding) are Mac-only.
  - MCP servers that need keys (github, Context7's API key) aren't added yet. They'd come from `private.fish` env vars.
  - pi packages are listed in the dotfiles' `config/dot_pi/agent/settings.json`, and bootstrap's "pi packages" step installs any that are missing. After `pi install <url>` on the Mac, run `chezmoi add ~/.pi/agent/settings.json` so the box follows. pi-claude-code needs `claude` logged in on the box.
- **`pi`** (the `pc` abbreviation) comes from mise as `npm:@earendil-works/pi-coding-agent`. That's the package `pi.dev/install.sh` installs into `~/.pi/agent/bin` on macOS. Bump it in `devbox-mise.toml`, not with pi's self-updater.
- **Metabase:** a blobless clone of upstream (`--filter=blob:none`) into `~/Workspaces/metabase/metabase`. That's the same path as on macOS, so path-based configs (like `CLAUDE.md` imports) carry over. The repo's own `mise.toml` pins Temurin **25**, Clojure, babashka, Bun, uv and Python, and `.nvmrc` pins Node. So the Java version depends on the directory: 21 globally, 25 inside the repo. `origin` fetches over HTTPS and pushes over SSH, so push with `ssh -A` or after `gh auth login`. Bootstrap runs only `mise install` there; full builds wait for Poom (`bun install`, `clojure -M:run`, `bun run dev`).
- **Clojure CLI comes from mise**, not the clojure.org script, to match the repo's `mise.toml`.
- **The app DB is PostgreSQL 16**, never H2. Bootstrap's `configure_postgres` installs it, trusts loopback connections (like Homebrew on macOS) and creates `metabase-dev` (`DEVBOX_PG_*` in `versions.env`). How agents run Metabase on the box lives in the private `metabase-devbox` skill (`~/.agents/skills`). Viewing it from the Mac needs ports 3000 and 8080 forwarded, because the dev page loads assets from `localhost:8080`.
- **Claude Code** uses the native installer and is never logged in automatically. `herdr integration install claude` adds its hook to `~/.claude/hooks/`. The dotfiles carry `~/.claude/CLAUDE.md` and `rules/` but not `settings.json`, so plugins come from `CLAUDE_PLUGINS` in `versions.env` instead (installed with `claude plugin install`).
- **Private skills** (`~/.agents/skills`, linked as `~/.claude/skills`, the same as on the Mac) come from a private repo. Its URL lives only in the gitignored `terraform.tfvars` as `skills_repo_url`, so it stays out of this public repo. Cloning needs GitHub SSH, which the box gets only through `ssh -A`, so `make rebootstrap` does it. Poom's Mac uses 1Password's SSH agent, so `ssh -A` forwards only the keys that agent offers (check with `ssh-add -l`). Leave his SSH key setup to him rather than probing his key files.
- **Agent memory** lives in `~/Workspaces/metabase/agent-private` on both machines: a private Git repo outside the Metabase checkout, so every worktree sees the same notes. It replaced the old `<checkout>/.agent-private` folder. The global `CLAUDE.md` imports its `AGENTS.md`, and Poom's review and doc skills write there. Review output, `scratchpad/` and DB backups are gitignored. On the box it clones like private skills (`agent_private_repo_url` in `terraform.tfvars`, then `make rebootstrap`).
- **Variables the caller exports override `devbox.env`** in bootstrap. That's how `make rebootstrap` passes `SKILLS_REPO_URL` to a box whose `devbox.env` predates it.

## Gotchas already found

- **chezmoi script ordering.** A plain `run_once_` script runs before files are written, so fisher ran before `fish_plugins` existed. The script is now `run_once_after_0_setup.sh.tmpl`.
- **fisher refuses plugins whose files are tracked.** enhancd and nix-env are now listed in `.chezmoiignore` and installed by fisher. A new fisher plugin's files belong in `.chezmoiignore`, not in the repo.
- **Base64 differs by provider.** Vultr's provider base64-encodes `user_data` itself, so pass plain text. Linode `metadata.user_data` needs `base64encode()`.
- **A sensitive variable in a `for_each` condition fails.** Wrap it: `nonsensitive(var.tailscale_auth_key != "")`.
- **`docker exec` sets no `$USER`**, so bootstrap derives it with `id -un`. Inside containers, swap, `sysctl --system` and Tailscale are skipped.
- **`make test-docker` on the Mac tests arm64.** The cloud boxes are x86_64.
- **The Metabase repo's `mise.toml` needs `mise trust`.** Global configs under `~/.config/mise` are trusted automatically.

## Open issues

Raise these with Poom before treating them as settled:

- **Git on the box:** the dotfiles' gitconfig sets `gpgsign = true` and the `credential.helper = osxkeychain` helper (macOS only), so commits fail on Linux until a signing approach is chosen (SSH signing over agent forwarding is one option). A fix belongs in `config/dot_gitconfig.tmpl` behind `{{ if eq .chezmoi.os "darwin" }}`.
- **`setup/shared/04-rustup.sh`** asks rustup for the removed `rls` component, which prints an error but doesn't stop anything.
- **Next steps not in v1** are listed in the README: a persistent volume, 1Password secrets, more providers, a Packer image.
