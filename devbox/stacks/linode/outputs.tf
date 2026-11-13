locals {
  ip = tolist(linode_instance.this.ipv4)[0]
}

output "ip" {
  value = local.ip
}

output "ssh" {
  value = "ssh ${var.username}@${local.ip}"
}

output "wait_for_bootstrap" {
  value = "ssh ${var.username}@${local.ip} cloud-init status --wait --long"
}
