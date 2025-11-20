locals {
  node = "iluvatar"
  protection = false  # for testing, otherwise true
  gateway = "192.168.86.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
  tranche = "dev"
  playbooks = {
    debug = {
      name = "debug"
      path = "playbooks/debug.yaml"
      playbook_tags = ["step1", "step2", "step3", "step4", "step5", "step6" ]
    }
    debug2 = {
      name = "debug2"
      path = "playbooks/debug2.yaml"
      playbook_tags = [ "step1", "step2" ]
    }
    kubernetes = {
      name = "kubernetes"
      path = "playbooks/kubernetes_cluster.yaml"
      playbook_tags = ["fellowship:install", "fellowship:assemble", "fellowship:configure",
                "fellowship:services", "fellowship:deploy" ]
    }
    vault = {
      name = "vault"
      path = "playbooks/hashicorp-vault-install.yaml"
      playbook_tags = [ "vault:install", "vault:kubevault" ]
    }
  }
  images = {
    kvm = {
      ubuntu = {
        "24" = "local:import/ubuntu-24.04-cloudimg-amd64.qcow2",
        "25" = "local:import/ubuntu-25.10-cloudimg-amd64.qcow2"
      },
      debian = {
        "12" = "local:import/debian-12-generic-amd64.qcow2",
        "13" = "local:import/debian-13-generic-amd64.qcow2"
      },
      centos = {
        "9" = "local:import/centos-9-stream-latest-x86_64.qcow2",
        "10" = "local:import/centos-10-stream-latest-x86_64.qcow2"
      },
      amazon = {
        "2" = "local:import/amzn2-kvm-x86_64.xfs.gpt.qcow2",
        "2023" = "local:import/al2023-kvm-x86_64.xfs.gpt.qcow2"
      }
    },
    lxc = {
      ubuntu = {
        "24" = "local:vztmpl/ubuntu-noble-latest-custom.tar.xz",
        "25" = "local:vztmpl/ubuntu-questing-latest-custom.tar.xz"
      },
      debian = {
        "12" = "local:vztmpl/debian-bookworm-latest-custom.tar.xz",
        "13" = "local:vztmpl/debian-trixie-latest-custom.tar.xz"
      },
      centos = {
        "9" = "local:vztmpl/centos-9-stream-latest-custom.tar.xz",
        "10" = "local:vztmpl/centos-10-stream-latest-custom.tar.xz"
      }
    }
  }
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
        host_tags = [ "fellowship:install", "fellowship:assemble" ]
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
        host_tags = [ "fellowship:install", "fellowship:assemble" ]
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
  dependencies = {
    theoden = {
      "fellowship:install" = [ "module.virtual_machines[\"theoden\"]" ],
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-5" ],
      "fellowship:services" = [ "ansible_playbook.theoden-kubernetes-3-of-5" ],
      "fellowship:deploy" = [ "ansible_playbook.faramir-vault-2-of-2" ]
    },
    eomer = {
      "fellowship:install" = [ "module.virtual_machines[\"eomer\"]" ],
      "fellowship:assemble" = [ "ansible_playbook.eomer-kubernetes-1-of-5", "ansible_playbook.theoden-kubernetes-1-of-5" ]
    },
    eowyn = {
      "fellowship:install" = [ "module.virtual_machines[\"eowyn\"]" ],
      "fellowship:assemble" = [ "ansible_playbook.eowyn-kubernetes-1-of-5", "ansible_playbook.eomer-kubernetes-2-of-5" ]
    },
    faramir = {
      "vault:install" = [ "module.containers[\"faramir\"]" ],
      "vault:kubevault" = [ "ansible_playbook.faramir-vault-1-of-2", "ansible_playbook.theoden-kubernetes-4-of-5" ]
    }
  }
}

# "fellowship:install", "fellowship:assemble", "fellowship:configure", "fellowship:services", "fellowship:deploy" 
# "vault:install", "vault:kubevault"