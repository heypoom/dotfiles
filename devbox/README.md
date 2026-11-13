# devbox

One `make apply` gives you a ready Metabase dev server in Singapore. Destroy it and apply again for the same box. Switching providers means switching `STACK`.

- `bootstrap/bootstrap.sh` does the real work. It's an idempotent installer for Ubuntu 24.04, and it also runs by hand on any Ubuntu machine.
- `modules/cloud-init` renders user data: it creates the dev user, locks down sshd, writes `bootstrap.sh` and runs it.
- `stacks/vultr` and `stacks/linode` are thin root modules with an SSH key, a firewall, an instance and outputs.

## Quick start (Vultr)

1. Create an API key at [my.vultr.com/settings/#settingsapi](https://my.vultr.com/settings/#settingsapi) and allowlist your IP there. You don't need to add an SSH key in the dashboard; Terraform uploads `~/.ssh/id_ed25519.pub`.
2. Optional: create a Tailscale auth key at [login.tailscale.com/admin/settings/keys](https://login.tailscale.com/admin/settings/keys). Make it **one-off** (not reusable) and **pre-approved**, and leave **ephemeral** off, so the node survives reboots.
3. Put the secrets in your environment. `~/.config/fish/private.fish` is a good place, since it's gitignored:

   ```fish
   set -gx VULTR_API_KEY ...
   set -gx TF_VAR_tailscale_auth_key tskey-auth-...
   ```

4. Apply and wait for bootstrap:

   ```bash
   make apply STACK=vultr
   make wait STACK=vultr          # streams until cloud-init reports done
   make push-secrets STACK=vultr  # copies private.fish
   make ssh STACK=vultr
   ```

For Linode, export `LINODE_TOKEN` and use `STACK=linode`.

Settings live in `stacks/<provider>/terraform.tfvars` (gitignored). See `terraform.tfvars.example`.

| Setting | Vultr | Linode |
|---|---|---|
| 8 GB, the default | `vhp-4c-8gb-amd`: 4 vCPU, 180 GB NVMe, $0.066/h, $48/mo | `g6-standard-4`: 4 vCPU, 160 GB, $0.072/h, $48/mo |
| 16 GB | `vhp-8c-16gb-amd`: 8 vCPU, 350 GB, $0.132/h, $96/mo | `g6-standard-6`: 6 vCPU, $0.144/h, $96/mo |
| Region | `sgp` | `sg-sin-2` (or `ap-south`) |

Prices are from the provider APIs on 2026-11-13. Both providers bill hourly up to the monthly cap.

## What you get

| Area | Details |
|---|---|
| User | `poom` with passwordless sudo and `fish` as the login shell. sshd allows keys only, with no root and no passwords. |
| Firewall | 22/tcp and 60000–61000/udp (mosh). 41641/udp is added when Tailscale is on. Set `public_ssh = false` to close 22 and mosh, leaving the box reachable over Tailscale only. |
| System | `fs.inotify.max_user_watches=1048576`, an 8 GB swapfile, `Asia/Bangkok` time, the `en_US.UTF-8` locale. |
| Dotfiles | `chezmoi init --apply heypoom`, which also runs the repo's `run_once` setup scripts (tpm, fisher, rustup). |
| Global mise tools | From the dotfiles' `config.toml` (shared with macOS): Java Temurin 21, Node 22, Python, Bun, Rust, git-spice, op, bat and more. From [`bootstrap/devbox-mise.toml`](bootstrap/devbox-mise.toml), copied to `~/.config/mise/conf.d/devbox.toml`: neovim, herdr, zellij, yazi, babashka, Clojure CLI, clj-kondo, gh, lazygit, delta, diff-so-fancy, eza, fx, tldr, ast-grep, hyperfine, btop, just, pnpm, sccache, uv, lazydocker, pgcli, `mb` (`@metabase/cli`), codex, pi. |
| apt | Build libraries, plus fish 4 (from the `fish-shell/release-4` PPA, matching macOS; Ubuntu ships 3.7), tmux, mosh, ripgrep, fd, fzf, jq, lnav, tig, ncdu, `psql`/`createdb` (`postgresql-client`), and Docker Engine with the compose and buildx plugins (from Docker's apt repo; `poom` is in the `docker` group). |
| Commit signing | Commits are signed with the box's own SSH key (`~/.ssh/signing_ed25519`, no passphrase), which bootstrap adds to GitHub as a signing key once `gh auth login` is done. macOS keeps signing with GPG. If the box is lost, delete its key at [github.com/settings/keys](https://github.com/settings/keys). |
| gh extensions | `GH_EXTENSIONS` (`gh stack`). Skipped until you run `gh auth login` on the box, then `make rebootstrap`. |
| Agents | Claude Code (native installer, not logged in), the herdr Claude integration, and the plugins in `CLAUDE_PLUGINS` (`versions.env`). [`bootstrap/claude-settings.json`](bootstrap/claude-settings.json) (vim mode, fullscreen TUI, effort levels) is merged into `~/.claude/settings.json`. User-scope MCP servers: context7 (no API key), sequential-thinking, git (on the Metabase repo) and sem. pi installs the packages listed in the dotfiles' `~/.pi/agent/settings.json`, such as `pi-claude-code`, which routes pi's Claude models through your logged-in `claude`. |
| Terminal and editor | Terminfo for `xterm-ghostty` and `xterm-kitty` (from `bootstrap/terminfo/`), so SSH from Ghostty or kitty renders correctly. nvchad's plugins are restored from the dotfiles' `lazy-lock.json` during bootstrap. The tide prompt matches macOS through the dotfiles' `run_onchange_after_1_tide-config.sh`. |
| Private skills | With `skills_repo_url` set, `make rebootstrap` clones that repo into `~/.agents/skills` and links `~/.claude/skills` to it. |
| Agent memory | With `agent_private_repo_url` set, `make rebootstrap` clones that private repo into `~/Workspaces/metabase/agent-private`, the same path as on macOS. Your global `CLAUDE.md` imports its `AGENTS.md`. |
| Metabase | A blobless clone of upstream into `~/Workspaces/metabase/metabase` (the same path as on macOS), with `mise install` run inside it. |
| App DB | PostgreSQL 16 on localhost with a `metabase-dev` database. Loopback connections need no password (like Homebrew on macOS), so `MB_DB_CONNECTION_URI='jdbc:postgresql://localhost:5432/metabase-dev?user=poom'` works as is. The private `metabase-devbox` skill covers running Metabase on the box. |
| Tailscale | `tailscale up --ssh` when a key is given. The key is deleted from disk after bootstrap. |

Choices worth knowing:

- **Clojure CLI comes from mise**, not the clojure.org script. Metabase's own `mise.toml` pins Clojure through mise, so the global and repo installs work the same way.
- **The Java version depends on where you are.** The global default is Temurin 21. Inside the Metabase repo, its `mise.toml` pins Temurin 25, and `.nvmrc` sets Node. mise switches automatically, through the shims fish puts on `PATH`.
- **Pushing to Metabase:** `origin` fetches over HTTPS and pushes over SSH. Connect with `ssh -A` so your local key signs the push, or run `gh auth login` on the box.
- **Versions:** global tool pins live in `bootstrap/devbox-mise.toml`; other settings live in `bootstrap/versions.env`. Change them there and run `make rebootstrap`. Leave tools that macOS gets from Homebrew out of the dotfiles' mise config.

## Claude Code on the box

1. **Plugins** install during the first boot, because their marketplaces are public GitHub repos.
2. **Private skills** need GitHub access, which the box doesn't have during cloud-init. So that step reports `skipped` on the first boot. Set `skills_repo_url` in `terraform.tfvars`, run `gh auth login` on the box, then run `make rebootstrap`. It copies the local `bootstrap/` to the box and re-runs it. The clone goes over HTTPS with `gh`'s credentials, so the box can pull and push without your SSH key. With a GitHub key forwarded over `ssh -A` (with 1Password's agent, the key has to be enabled for the SSH agent), it clones over SSH instead. Afterwards, update the skills with `git -C ~/.agents/skills pull` on the box.
3. **Log in** by hand: `ssh` in, run `claude`, then `/login`, and open the URL it prints on your Mac.

## Secrets

Nothing secret goes in git. Two rules:

- **API tokens** (`VULTR_API_KEY`, `LINODE_TOKEN`) are read only from the environment.
- **`terraform.tfstate` holds the rendered user data in plain text**, including the Tailscale key. It stays local and gitignored. A one-off key is useless once the box has joined the tailnet.

`private.fish` (personal tokens and the like) never goes through Terraform. `make push-secrets` copies it over scp with mode 600.

## Run bootstrap by hand (no Terraform)

On any Ubuntu 24.04 machine, as a non-root user with passwordless sudo:

```bash
git clone https://github.com/heypoom/dotfiles ~/.local/share/chezmoi
DOTFILES_GITHUB_USER=heypoom ~/.local/share/chezmoi/devbox/bootstrap/bootstrap.sh
```

`bootstrap.sh` reuses that clone for chezmoi. Every input is an environment variable, documented at the top of the script (for example `METABASE_REPO_URL=` skips the clone, and `TAILSCALE_AUTH_KEY=...` turns on Tailscale). Re-running is safe and only fixes what's missing. The log is at `~/.devbox-bootstrap.log`.

Already-applied dotfiles are left alone on later runs. Use `chezmoi update` for those.

## Checks

```bash
make check        # terraform fmt + validate (both stacks), shellcheck, cloud-init schema
make test-docker  # bootstrap.sh twice in ubuntu:24.04; fails if the second run changes anything
```

`make test-docker` runs natively on Apple Silicon, so it tests arm64. The cloud boxes are x86_64.

## Smoke test on a fresh box

```bash
cloud-init status --wait            # done
java -version                       # 21
clojure --version; node -v; nvim --version; herdr --version
claude --version; chezmoi --version; mise doctor
cd ~/Workspaces/metabase/metabase
clojure -P -M:dev                   # backend deps resolve
bun install                         # frontend deps
```

Measured on 2026-11-13 (Vultr `vhp-4c-8gb-amd`, `sgp`):

| Stage | Time |
|---|---|
| `apply` to instance created | 2 min 9 s |
| `apply` to `cloud-init status: done` | 8 min 8 s |
| `clojure -P -M:dev` (first run) | 61 s |
| `bun install` (first run) | 33 s |

## State

State is local, in `stacks/<provider>/terraform.tfstate`. To share it between machines, add a remote backend later, such as Terraform Cloud's free tier or an S3-compatible bucket (Vultr Object Storage, Linode Object Storage) with encryption on.

## Next steps (not in v1)

- **Persistent volume** for `~/Workspaces`, `~/.m2` and `~/.gitlibs`, so a rebuild doesn't download everything again. This needs format-if-empty and mount logic in cloud-init.
- **Secrets from 1Password**: turn `private.fish` into a chezmoi template using `onepasswordRead`, with `op` signed in on the box. That would replace `make push-secrets`.
- **More providers**: DigitalOcean, Hetzner, AWS `ap-southeast-7` (Bangkok).
- **A pre-baked image** (Packer snapshot) for faster boots.
