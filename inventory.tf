resource "ansible_group" "containers" {
  name = "containers"
}

resource "ansible_group" "virtual_machines" {
  name = "virtual_machines"
}

resource "ansible_group" "vaults" {
  name = "vaults"
  children = [ansible_host.faramir.name]
}

resource "ansible_group" "kubernetes" {
  name = "kubernetes"
  children = [ansible_host.theoden.name, ansible_host.eomer.name, ansible_host.eowyn.name]
}

resource "ansible_group" "main" {
  name = "main"
  children = [ansible_host.theoden.name]
}

resource "ansible_group" "nodes" {
  name = "nodes"
  children = [ansible_host.eomer.name, ansible_host.eowyn.name]
}

resource "ansible_host" "faramir" {
  name   = "faramir"
  groups = ["vaults","containers"]

  variables = {
    ansible_user  = "ubuntu"
    static_ip = "192.168.86.97"
    vmid = "210"
    type = "lxc"
    os = "ubuntu"
  }
}

resource "ansible_host" "theoden" {
  name   = "theoden"
  groups = ["kubernetes","main","virtual_machines"]

  variables = {
    ansible_user  = "ubuntu"
    static_ip = "192.168.86.100"
    vmid = "410"
    type = "kvm"
    os = "ubuntu"
  }
}

resource "ansible_host" "eomer" {
  name   = "eomer"
  groups = ["kubernetes","nodes","virtual_machines"]

  variables = {
    ansible_user  = "ubuntu"
    static_ip = "192.168.86.101"
    vmid = "411"
    type = "kvm"
    os = "ubuntu"
  }
}

resource "ansible_host" "eowyn" {
  name   = "eowyn"
  groups = ["kubernetes","nodes","virtual_machines"]

  variables = {
    ansible_user  = "ubuntu"
    static_ip = "192.168.86.102"
    vmid = "412"
    type = "kvm"
    os = "ubuntu"
  }
}