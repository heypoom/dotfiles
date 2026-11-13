variable "hostname" {
  description = "Machine hostname."
  type        = string
  default     = "devbox"
}

variable "username" {
  description = "Non-root dev user with passwordless sudo."
  type        = string
  default     = "poom"

  validation {
    condition     = can(regex("^[a-z_][a-z0-9_-]{0,31}$", var.username))
    error_message = "username must be a valid Linux user name."
  }
}

variable "ssh_public_keys" {
  description = "SSH public keys allowed to log in as the dev user."
  type        = list(string)

  validation {
    condition     = length(var.ssh_public_keys) > 0
    error_message = "Provide at least one SSH public key."
  }
}

variable "dotfiles_github_user" {
  description = "GitHub user for `chezmoi init`. Empty skips dotfiles."
  type        = string
  default     = ""
}

variable "shell" {
  description = "Login shell for the dev user."
  type        = string
  default     = "fish"

  validation {
    condition     = contains(["fish", "zsh", "bash"], var.shell)
    error_message = "shell must be fish, zsh or bash."
  }
}

variable "metabase_repo_url" {
  description = "Metabase repo to clone. Empty skips the clone."
  type        = string
  default     = "https://github.com/metabase/metabase.git"
}

variable "metabase_push_url" {
  description = "Push URL for origin. Push works over SSH agent forwarding (`ssh -A`)."
  type        = string
  default     = "git@github.com:metabase/metabase.git"
}

variable "metabase_dir" {
  description = "Clone location. Matches the macOS path so path-based configs carry over."
  type        = string
  default     = "~/Workspaces/metabase/metabase"
}

variable "tailscale_auth_key" {
  description = "Tailscale auth key. Use a one-off, pre-approved key. Empty skips Tailscale."
  type        = string
  default     = ""
  sensitive   = true
}

variable "extra_env" {
  description = "Extra KEY = value pairs written to /opt/devbox/devbox.env (e.g. versions.env overrides)."
  type        = map(string)
  default     = {}
}
