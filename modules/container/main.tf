resource "proxmox_virtual_environment_container" "container" {
  start_on_boot = true
  unprivileged = true
  node_name = var.node
  protection = var.protection
  pool_id = var.pool

  vm_id = var.vmid

  initialization {
    hostname     = var.name
    ip_config {
      ipv4 {
        address = "${var.static_ip}/24"
        gateway = var.gateway
      }
    }

    user_account {
      keys = var.ssh_public_key
    }
  }

  network_interface {
    name = "veth0"
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
    swap = var.swap
  }

  operating_system {
    template_file_id = var.template
    type             = var.os
  }

  disk {
    datastore_id = var.diskpool
    size         = var.disk
  }

  # hook_script_file_id = var.hookscript != "" ? var.hookscript : null
}
