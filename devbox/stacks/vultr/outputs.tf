output "ip" {
  value = vultr_instance.this.main_ip
}

output "ssh" {
  value = "ssh ${var.username}@${vultr_instance.this.main_ip}"
}

output "wait_for_bootstrap" {
  value = "ssh ${var.username}@${vultr_instance.this.main_ip} cloud-init status --wait --long"
}
