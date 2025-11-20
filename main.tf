module "containers" {
  for_each = {
    for name, type in local.vis : name => type if type.type == "lxc"
  }
  source   = "./modules/container"

  node           = local.node
  protection     = local.protection
  gateway        = local.gateway
  ssh_public_key = local.ssh_keys
  name           = each.key
  vmid           = each.value.vmid
  static_ip      = each.value.static_ip
  cores          = each.value.cores
  memory         = each.value.memory
  template       = local.images["lxc"][each.value.os][each.value.release]
  os             = each.value.os
  diskpool       = each.value.diskpool
  disk           = each.value.disk
  pool           = each.value.pool
  groups         = each.value.groups
}

module "virtual_machines" {
  for_each = {
    for name, type in local.vis : name => type if type.type == "kvm"
  }
  source   = "./modules/virtual_machine"

  node           = local.node
  protection     = local.protection
  gateway        = local.gateway
  ssh_public_key = local.ssh_keys
  name           = each.key
  vmid           = each.value.vmid
  static_ip      = each.value.static_ip
  cores          = each.value.cores
  memory         = each.value.memory
  template       = local.images["kvm"][each.value.os][each.value.release]
  os             = each.value.os
  diskpool       = each.value.diskpool
  bootdisk       = each.value.bootdisk
  extradisk      = each.value.extradisk
  pool           = each.value.pool
  groups         = each.value.groups
}

data "local_file" "ssh_public_key" {
  filename = "/home/ubuntu/.ssh/id_rsa.pub"
}
