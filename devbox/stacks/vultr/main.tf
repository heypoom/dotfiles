module "cloud_init" {
  source = "../../modules/cloud-init"

  hostname             = var.hostname
  username             = var.username
  ssh_public_keys      = [file(pathexpand(var.ssh_public_key_path))]
  dotfiles_github_user = var.dotfiles_github_user
  shell                = var.shell
  metabase_repo_url    = var.metabase_repo_url
  tailscale_auth_key   = var.tailscale_auth_key
}

resource "vultr_ssh_key" "this" {
  name    = "${var.hostname}-${var.username}"
  ssh_key = trimspace(file(pathexpand(var.ssh_public_key_path)))
}

resource "vultr_firewall_group" "this" {
  description = var.hostname
}

locals {
  inbound_rules = merge(
    var.public_ssh ? {
      ssh  = { protocol = "tcp", port = "22" }
      mosh = { protocol = "udp", port = "60000:61000" }
    } : {},
    # Lets Tailscale make direct connections instead of relaying through DERP.
    nonsensitive(var.tailscale_auth_key != "") ? {
      tailscale = { protocol = "udp", port = "41641" }
    } : {},
  )
}

resource "vultr_firewall_rule" "inbound" {
  for_each = local.inbound_rules

  firewall_group_id = vultr_firewall_group.this.id
  protocol          = each.value.protocol
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = each.value.port
  notes             = each.key
}

resource "vultr_instance" "this" {
  region            = var.region
  plan              = var.plan
  os_id             = var.os_id
  label             = var.hostname
  hostname          = var.hostname
  tags              = ["devbox"]
  ssh_key_ids       = [vultr_ssh_key.this.id]
  firewall_group_id = vultr_firewall_group.this.id
  enable_ipv6       = false
  backups           = "disabled"
  activation_email  = false

  # The provider base64-encodes user_data itself.
  user_data = module.cloud_init.user_data

  lifecycle {
    precondition {
      condition     = var.public_ssh || var.tailscale_auth_key != ""
      error_message = "public_ssh = false needs a tailscale_auth_key, or the box is unreachable."
    }
  }
}
