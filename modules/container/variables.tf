variable "node" {
  type        = string
  description = "Proxmox node to deploy on"
}

variable "protection" {
  type        = bool
  description = "Enable protection for the container"
  default     = false
}

variable "vmid" {
  type        = number
  description = "Unique VMID for the container"
}

variable "name" {
  type        = string
  description = "Hostname of the container"
}

variable "static_ip" {
  type        = string
  description = "Static IP address for the container"
}

variable "gateway" {
  type        = string
  description = "Gateway for the container"
}

variable "cores" {
  type        = number
  default     = 2
}

variable "memory" {
  type        = number
  default     = 2048
}

variable "swap" {
  type        = number
  default     = 0
}

variable "template" {
  type        = string
  description = "Container template to use"
  default     = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}

variable "os" {
  type        = string
  description = "Operating system type"
  default     = "ubuntu"
}

variable "diskpool" {
  type        = string
  description = "Storage pool for the container disk"
  default     = "local-lvm"
}

variable "disk" {
  type        = number
  default     = 8
  description = "Disk size in GB"  
}

variable "pool" {
  type        = string
}

variable "ssh_public_key" {
  type        = list(string)
  description = "SSH public key for root access"
}

variable "hookscript" {
  type        = string
  description = "Hook script to run on container events"
  default     = ""
}

variable "groups" {
  type = list(string)
  description = "list of ansible_groups"
}