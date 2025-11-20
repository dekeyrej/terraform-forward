variable "virtual_environment_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
  default     = "https://proxmox.example.com:8006/"
}

variable "virtual_environment_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "virtual_environment_username" {
  description = "Proxmox username with realm"
  type        = string
  default     = "root@pam"
}

variable "virtual_environment_password" {
  description = "Proxmox password"
  type        = string
  default     = "your_password"
  sensitive   = true
}

variable "virtual_environment_apitoken" {
  description = "Proxmox API token"
  type        = string
  default     = "user@realm!tokenid=your_token_value"
  sensitive   = true
}
