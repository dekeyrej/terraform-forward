resource "proxmox_virtual_environment_vm" "virtual_machine" {
  on_boot = true
  stop_on_destroy = true
  node_name = var.node
  pool_id = var.pool
  protection = var.protection

  name      = var.name
  vm_id     = var.vmid
  description = <<-EOT
    ### ${var.name} @ ${var.static_ip}
    - Managed by Terraform

    ### Running **Ubuntu 24.04-3**
    
    | **Hardware** | Value |
    | --- | --- |
    | **Cores** | ${var.cores} |
    | **RAM** | ${var.memory} |
    | **Bootdisk** | SCSI0 - ${var.bootdisk}G |
    | **Cephdisk** | SCSI1 - ${var.extradisk}G |
  EOT

  initialization {
    datastore_id = var.diskpool
    ip_config {
      ipv4 {
        address = "${var.static_ip}/24"
        gateway = var.gateway
      }
    }

    user_account {
      username = "ubuntu"
      keys = var.ssh_public_key
    }
  }
  
  network_device {
    bridge = "vmbr0"
  }  
  
  cpu {
    cores = var.cores
    sockets = 1
    type = "host"
  }

  memory {
    dedicated = var.memory
    floating  = var.memory
  }

  operating_system {
    type = var.ostype
  }

  disk {
    datastore_id = var.diskpool
    import_from  = var.template
    interface    = "scsi0"
    ssd          = true
    size         = var.bootdisk
  }

  dynamic "disk" {
    for_each = var.extradisk > 0 ? [1] : []
    content {
      datastore_id = var.diskpool
      interface    = "scsi1"
      ssd          = true
      size         = var.extradisk
    }
  }

  serial_device {}
}
