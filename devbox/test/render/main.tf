# Renders the cloud-init user data with dummy inputs, for `make schema`.
# No providers and no cloud resources; local state is gitignored.
module "cloud_init" {
  source = "../../modules/cloud-init"

  ssh_public_keys      = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDummyDummyDummyDummyDummyDummyDummyDummy test@devbox"]
  dotfiles_github_user = "heypoom"
  tailscale_auth_key   = "tskey-auth-dummy"
}

output "user_data" {
  value     = module.cloud_init.user_data
  sensitive = true
}
