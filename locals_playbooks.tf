locals {
  playbooks = {
    kubernetes = {
      name = "kubernetes"
      path = "playbooks/kubernetes_cluster.yaml"
      playbook_tags = ["fellowship:install", "fellowship:assemble", "fellowship:configure", "fellowship:services", "fellowship:deploy" ]
    }
    vault = {
      name = "vault"
      path = "playbooks/hashicorp-vault-install.yaml"
      playbook_tags = [ "vault:install", "vault:kubevault" ]
    }
  }
}
