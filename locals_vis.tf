locals {
  vis = {
    theoden = {
        name = "theoden"
        fqdn = "theoden.local"
        type = "kvm"
        vmid = 410
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.100"
        cores = 4
        memory = 8192
        diskpool = "ssd_pool"
        bootdisk =  20
        extradisk = 0
        pool = "Rohan"
        groups = ["kubernetes","main"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:configure", "fellowship:services", "fellowship:deploy" ]
    }
    eomer = {
        name = "eomer"
        fqdn = "eomer.local"
        type = "kvm"
        vmid = 411
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.101"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "ssd_pool"
        pool = "Rohan"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    eowyn = {
        name = "eowyn"
        fqdn = "eowyn.local"
        type = "kvm"
        vmid = 412
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.102"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "ssd_pool"
        pool = "Rohan"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    faramir = {
        name = "faramir"
        fqdn = "faramir.local"
        type = "lxc"
        vmid = 210
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.97"
        cores = 2
        memory = 2048
        disk = 10
        diskpool = "ssd_pool"
        pool = "Rohan"
        groups = ["vaults"]
        playbook = "vault"
        host_tags = [ "vault:install", "vault:kubevault" ]
    }
  }
}
