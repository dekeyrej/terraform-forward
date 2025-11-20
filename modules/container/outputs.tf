output "vm_id" {
  value = proxmox_virtual_environment_container.container.vm_id
}

output "hostname" {
  value = proxmox_virtual_environment_container.container.initialization[0].hostname
  }

output "ip_address" {
  value = proxmox_virtual_environment_container.container.initialization[0].ip_config[0].ipv4[0].address
}

output "os" {
  value = var.os
}

output "type" {
  value = "lxc"
}