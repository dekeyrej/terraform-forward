provider "proxmox" {
  # Required Configuration options
  endpoint = var.virtual_environment_endpoint
  insecure = var.virtual_environment_insecure
  username = var.virtual_environment_username
  # Optional Configuration options - must set one of password or api_token
  password = var.virtual_environment_password
  api_token = var.virtual_environment_apitoken
}
