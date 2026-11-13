variable "region" {
  description = "Vultr region id."
  type        = string
  default     = "sgp"
}

variable "plan" {
  description = "Plan id. vhp-4c-8gb-amd ($48/mo) or vhp-8c-16gb-amd ($96/mo)."
  type        = string
  default     = "vhp-4c-8gb-amd"
}

variable "os_id" {
  description = "OS id. 2284 is Ubuntu 24.04 LTS x64."
  type        = number
  default     = 2284
}

variable "hostname" {
  type    = string
  default = "devbox"
}

variable "username" {
  type    = string
  default = "poom"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

variable "dotfiles_github_user" {
  type    = string
  default = "heypoom"
}

variable "shell" {
  type    = string
  default = "fish"
}

variable "metabase_repo_url" {
  type    = string
  default = "https://github.com/metabase/metabase.git"
}

variable "tailscale_auth_key" {
  description = "One-off Tailscale auth key. Set TF_VAR_tailscale_auth_key. Empty skips Tailscale."
  type        = string
  default     = ""
  sensitive   = true
}

variable "skills_repo_url" {
  description = "Private skills repo SSH URL. Keep it in terraform.tfvars (gitignored)."
  type        = string
  default     = ""
}

variable "agent_private_repo_url" {
  description = "Private agent-memory repo SSH URL. Keep it in terraform.tfvars (gitignored)."
  type        = string
  default     = ""
}

variable "public_ssh" {
  description = "Open SSH (22/tcp) and mosh (60000-61000/udp) to the internet. Set false to reach the box only over Tailscale."
  type        = bool
  default     = true
}
