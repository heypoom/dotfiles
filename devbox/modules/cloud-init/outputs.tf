output "user_data" {
  description = "Rendered cloud-init user data (plain text). It may contain the Tailscale key."
  sensitive   = true
  value = templatefile("${path.module}/cloud-init.yaml.tftpl", {
    hostname        = var.hostname
    username        = var.username
    ssh_public_keys = [for k in var.ssh_public_keys : trimspace(k)]
    # Every file under bootstrap/, so adding one needs no change here.
    bootstrap_files = [for f in sort(fileset(local.bootstrap_dir, "**")) : {
      path = f
      mode = endswith(f, ".sh") ? "0755" : "0644"
      b64  = filebase64("${local.bootstrap_dir}/${f}")
    }]
    devbox_env_b64 = base64encode(local.devbox_env)
  })
}
