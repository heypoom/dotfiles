terraform {
  required_version = ">= 1.5"
}

locals {
  bootstrap_dir = "${path.module}/../../bootstrap"

  # bootstrap.sh sources this file, so every value is single-quoted.
  # `~/` is expanded by bootstrap's own HOME, not quoted literally.
  env = merge(
    {
      DOTFILES_GITHUB_USER   = var.dotfiles_github_user
      DEVBOX_SHELL           = var.shell
      METABASE_REPO_URL      = var.metabase_repo_url
      METABASE_PUSH_URL      = var.metabase_push_url
      TAILSCALE_HOSTNAME     = var.hostname
      TAILSCALE_AUTH_KEY     = var.tailscale_auth_key
      SKILLS_REPO_URL        = var.skills_repo_url
      AGENT_PRIVATE_REPO_URL = var.agent_private_repo_url
    },
    var.extra_env,
  )

  metabase_dir_line = startswith(var.metabase_dir, "~/") ? "METABASE_DIR=\"$HOME/${trimprefix(var.metabase_dir, "~/")}\"" : "METABASE_DIR='${var.metabase_dir}'"

  devbox_env = join("\n", concat(
    ["# Written by cloud-init. Sourced by bootstrap.sh."],
    [for k in sort(keys(local.env)) : "${k}='${local.env[k]}'"],
    [local.metabase_dir_line, ""],
  ))
}

check "env_values_are_quotable" {
  assert {
    condition     = alltrue([for v in values(local.env) : !strcontains(v, "'")])
    error_message = "devbox.env values cannot contain single quotes."
  }
}
