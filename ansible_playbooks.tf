# theoden enters fellowship:install — dependent on 1 prior incantations
resource "ansible_playbook" "theoden-kubernetes-1-of-5" {
  # dependency info
  depends_on = [
    module.virtual_machines["theoden"]  
  ]
  # inventory info
  name       = "theoden"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/theoden.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_theoden-kubernetes-1-of-5-stdout" {
  depends_on = [ ansible_playbook.theoden-kubernetes-1-of-5 ]
  value = ansible_playbook.theoden-kubernetes-1-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_theoden-kubernetes-1-of-5-stderr" {
  depends_on = [ ansible_playbook.theoden-kubernetes-1-of-5 ]
  value = ansible_playbook.theoden-kubernetes-1-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# theoden enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "theoden-kubernetes-3-of-5" {
  # dependency info
  depends_on = [
    ansible_playbook.eowyn-kubernetes-2-of-5  
  ]
  # inventory info
  name       = "theoden"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/theoden.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_theoden-kubernetes-3-of-5-stdout" {
  depends_on = [ ansible_playbook.theoden-kubernetes-3-of-5 ]
  value = ansible_playbook.theoden-kubernetes-3-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_theoden-kubernetes-3-of-5-stderr" {
  depends_on = [ ansible_playbook.theoden-kubernetes-3-of-5 ]
  value = ansible_playbook.theoden-kubernetes-3-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# theoden enters fellowship:services — dependent on 3 prior incantations
resource "ansible_playbook" "theoden-kubernetes-4-of-5" {
  # dependency info
  depends_on = [
    ansible_playbook.theoden-kubernetes-3-of-5,
    ansible_playbook.eomer-kubernetes-3-of-5,
    ansible_playbook.eowyn-kubernetes-3-of-5  
  ]
  # inventory info
  name       = "theoden"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:services"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/theoden.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_theoden-kubernetes-4-of-5-stdout" {
  depends_on = [ ansible_playbook.theoden-kubernetes-4-of-5 ]
  value = ansible_playbook.theoden-kubernetes-4-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_theoden-kubernetes-4-of-5-stderr" {
  depends_on = [ ansible_playbook.theoden-kubernetes-4-of-5 ]
  value = ansible_playbook.theoden-kubernetes-4-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# theoden enters fellowship:deploy — dependent on 1 prior incantations
resource "ansible_playbook" "theoden-kubernetes-5-of-5" {
  # dependency info
  depends_on = [
    ansible_playbook.faramir-vault-2-of-2  
  ]
  # inventory info
  name       = "theoden"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:deploy"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/theoden.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_theoden-kubernetes-5-of-5-stdout" {
  depends_on = [ ansible_playbook.theoden-kubernetes-5-of-5 ]
  value = ansible_playbook.theoden-kubernetes-5-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_theoden-kubernetes-5-of-5-stderr" {
  depends_on = [ ansible_playbook.theoden-kubernetes-5-of-5 ]
  value = ansible_playbook.theoden-kubernetes-5-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# eomer enters fellowship:install — dependent on 1 prior incantations
resource "ansible_playbook" "eomer-kubernetes-1-of-5" {
  # dependency info
  depends_on = [
    module.virtual_machines["eomer"]  
  ]
  # inventory info
  name       = "eomer"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/eomer.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_eomer-kubernetes-1-of-5-stdout" {
  depends_on = [ ansible_playbook.eomer-kubernetes-1-of-5 ]
  value = ansible_playbook.eomer-kubernetes-1-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_eomer-kubernetes-1-of-5-stderr" {
  depends_on = [ ansible_playbook.eomer-kubernetes-1-of-5 ]
  value = ansible_playbook.eomer-kubernetes-1-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# eomer enters fellowship:assemble — dependent on 2 prior incantations
resource "ansible_playbook" "eomer-kubernetes-2-of-5" {
  # dependency info
  depends_on = [
    ansible_playbook.eomer-kubernetes-1-of-5,
    ansible_playbook.theoden-kubernetes-1-of-5  
  ]
  # inventory info
  name       = "eomer"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:assemble"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/eomer.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_eomer-kubernetes-2-of-5-stdout" {
  depends_on = [ ansible_playbook.eomer-kubernetes-2-of-5 ]
  value = ansible_playbook.eomer-kubernetes-2-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_eomer-kubernetes-2-of-5-stderr" {
  depends_on = [ ansible_playbook.eomer-kubernetes-2-of-5 ]
  value = ansible_playbook.eomer-kubernetes-2-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# eowyn enters fellowship:install — dependent on 1 prior incantations
resource "ansible_playbook" "eowyn-kubernetes-1-of-5" {
  # dependency info
  depends_on = [
    module.virtual_machines["eowyn"]  
  ]
  # inventory info
  name       = "eowyn"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/eowyn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_eowyn-kubernetes-1-of-5-stdout" {
  depends_on = [ ansible_playbook.eowyn-kubernetes-1-of-5 ]
  value = ansible_playbook.eowyn-kubernetes-1-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_eowyn-kubernetes-1-of-5-stderr" {
  depends_on = [ ansible_playbook.eowyn-kubernetes-1-of-5 ]
  value = ansible_playbook.eowyn-kubernetes-1-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# eowyn enters fellowship:assemble — dependent on 2 prior incantations
resource "ansible_playbook" "eowyn-kubernetes-2-of-5" {
  # dependency info
  depends_on = [
    ansible_playbook.eowyn-kubernetes-1-of-5,
    ansible_playbook.eomer-kubernetes-2-of-5  
  ]
  # inventory info
  name       = "eowyn"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:assemble"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/eowyn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_eowyn-kubernetes-2-of-5-stdout" {
  depends_on = [ ansible_playbook.eowyn-kubernetes-2-of-5 ]
  value = ansible_playbook.eowyn-kubernetes-2-of-5.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_eowyn-kubernetes-2-of-5-stderr" {
  depends_on = [ ansible_playbook.eowyn-kubernetes-2-of-5 ]
  value = ansible_playbook.eowyn-kubernetes-2-of-5.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# faramir enters vault:install — dependent on 1 prior incantations
resource "ansible_playbook" "faramir-vault-1-of-2" {
  # dependency info
  depends_on = [
    module.containers["faramir"]  
  ]
  # inventory info
  name       = "faramir"
  groups     = ["vaults"]
  # playbook info
  playbook   = "${path.module}/playbooks/hashicorp-vault-install.yaml"
  tags       = ["vault:install"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/faramir.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_faramir-vault-1-of-2-stdout" {
  depends_on = [ ansible_playbook.faramir-vault-1-of-2 ]
  value = ansible_playbook.faramir-vault-1-of-2.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_faramir-vault-1-of-2-stderr" {
  depends_on = [ ansible_playbook.faramir-vault-1-of-2 ]
  value = ansible_playbook.faramir-vault-1-of-2.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# faramir enters vault:kubevault — dependent on 2 prior incantations
resource "ansible_playbook" "faramir-vault-2-of-2" {
  # dependency info
  depends_on = [
    ansible_playbook.faramir-vault-1-of-2,
    ansible_playbook.theoden-kubernetes-4-of-5  
  ]
  # inventory info
  name       = "faramir"
  groups     = ["vaults"]
  # playbook info
  playbook   = "${path.module}/playbooks/hashicorp-vault-install.yaml"
  tags       = ["vault:kubevault"]
  
  var_files  = [
    "${path.module}/inventory/group_vars/all.yml",
    "${path.module}/inventory/group_vars/dev.yml",
    "${path.module}/inventory/host_vars/faramir.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_faramir-vault-2-of-2-stdout" {
  depends_on = [ ansible_playbook.faramir-vault-2-of-2 ]
  value = ansible_playbook.faramir-vault-2-of-2.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_faramir-vault-2-of-2-stderr" {
  depends_on = [ ansible_playbook.faramir-vault-2-of-2 ]
  value = ansible_playbook.faramir-vault-2-of-2.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
