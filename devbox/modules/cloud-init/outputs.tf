output "user_data" {
  description = "Rendered cloud-init user data (plain text). It may contain the Tailscale key."
  sensitive   = true
  value = templatefile("${path.module}/cloud-init.yaml.tftpl", {
    hostname         = var.hostname
    username         = var.username
    ssh_public_keys  = [for k in var.ssh_public_keys : trimspace(k)]
    bootstrap_sh_b64 = filebase64("${local.bootstrap_dir}/bootstrap.sh")
    versions_env_b64 = filebase64("${local.bootstrap_dir}/versions.env")
    devbox_mise_b64  = filebase64("${local.bootstrap_dir}/devbox-mise.toml")
    devbox_env_b64   = base64encode(local.devbox_env)
  })
}
