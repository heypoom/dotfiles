variable "region" {
  description = "Linode region. sg-sin-2 is the newer Singapore site; ap-south is the older one."
  type        = string
  default     = "sg-sin-2"
}

variable "type" {
  description = "Linode type. g6-standard-4 (8 GB, $48/mo) or g6-standard-6 (16 GB, $96/mo)."
  type        = string
  default     = "g6-standard-4"
}

variable "image" {
  description = "Image id. Needs cloud-init >= 23.3.1 for the Metadata service."
  type        = string
  default     = "linode/ubuntu24.04"
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
