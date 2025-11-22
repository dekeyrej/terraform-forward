locals {
  dependencies = {
    theoden = {
      "fellowship:install" = [ "module.virtual_machines[\"theoden\"]" ],
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-5" ],
      "fellowship:services" = [ "ansible_playbook.theoden-kubernetes-3-of-5", "ansible_playbook.eomer-kubernetes-3-of-5", "ansible_playbook.eowyn-kubernetes-3-of-5" ],
      "fellowship:deploy" = [ "ansible_playbook.faramir-vault-2-of-2" ]
    },
    eomer = {
      "fellowship:install" = [ "module.virtual_machines[\"eomer\"]" ],
      "fellowship:assemble" = [ "ansible_playbook.eomer-kubernetes-1-of-5", "ansible_playbook.theoden-kubernetes-1-of-5" ],
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-5" ]
    },
    eowyn = {
      "fellowship:install" = [ "module.virtual_machines[\"eowyn\"]" ],
      "fellowship:assemble" = [ "ansible_playbook.eowyn-kubernetes-1-of-5", "ansible_playbook.eomer-kubernetes-2-of-5" ],
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-5" ]
    },
    faramir = {
      "vault:install" = [ "module.containers[\"faramir\"]" ],
      "vault:kubevault" = [ "ansible_playbook.faramir-vault-1-of-2", "ansible_playbook.theoden-kubernetes-4-of-5" ]
    }
  }
}
