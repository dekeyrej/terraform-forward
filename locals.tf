locals {
  node = "iluvatar"
  tranche = "dev"
  protection = false  # for testing, otherwise true
  gateway = "192.168.86.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
}
