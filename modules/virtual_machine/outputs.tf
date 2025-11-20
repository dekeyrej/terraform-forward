output "vm_id" {
  value = proxmox_virtual_environment_vm.virtual_machine.vm_id
}

output "hostname" {
  value = proxmox_virtual_environment_vm.virtual_machine.name
  }

output "ip_address" {
  value = proxmox_virtual_environment_vm.virtual_machine.initialization[0].ip_config[0].ipv4[0].address
}

output "os" {
  value = var.os
}

output "type" {
  value = "kvm"
}