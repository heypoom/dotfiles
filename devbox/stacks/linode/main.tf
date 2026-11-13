module "cloud_init" {
  source = "../../modules/cloud-init"

  hostname               = var.hostname
  username               = var.username
  ssh_public_keys        = [file(pathexpand(var.ssh_public_key_path))]
  dotfiles_github_user   = var.dotfiles_github_user
  shell                  = var.shell
  metabase_repo_url      = var.metabase_repo_url
  tailscale_auth_key     = var.tailscale_auth_key
  skills_repo_url        = var.skills_repo_url
  agent_private_repo_url = var.agent_private_repo_url
}

resource "linode_instance" "this" {
  label  = var.hostname
  region = var.region
  type   = var.type
  image  = var.image
  tags   = ["devbox"]

  # Root key only; cloud-init disables root login and adds the dev user.
  authorized_keys = [trimspace(file(pathexpand(var.ssh_public_key_path)))]

  metadata {
    # Linode needs base64 here, unlike Vultr.
    user_data = base64encode(module.cloud_init.user_data)
  }

  lifecycle {
    precondition {
      condition     = var.public_ssh || var.tailscale_auth_key != ""
      error_message = "public_ssh = false needs a tailscale_auth_key, or the box is unreachable."
    }
  }
}

locals {
  inbound_rules = merge(
    var.public_ssh ? {
      ssh  = { protocol = "TCP", ports = "22" }
      mosh = { protocol = "UDP", ports = "60000-61000" }
    } : {},
    # Lets Tailscale make direct connections instead of relaying through DERP.
    nonsensitive(var.tailscale_auth_key != "") ? {
      tailscale = { protocol = "UDP", ports = "41641" }
    } : {},
  )
}

resource "linode_firewall" "this" {
  label           = var.hostname
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  linodes         = [linode_instance.this.id]

  dynamic "inbound" {
    for_each = local.inbound_rules
    content {
      label    = inbound.key
      action   = "ACCEPT"
      protocol = inbound.value.protocol
      ports    = inbound.value.ports
      ipv4     = ["0.0.0.0/0"]
      ipv6     = ["::/0"]
    }
  }
}
