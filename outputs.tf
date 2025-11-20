output "all_nodes_info" {
  value = merge(
    {
      for name, module in module.containers :
      name => {
        vm_id      = module.vm_id
        hostname   = module.hostname
        ip_address = module.ip_address
        os         = module.os
        type       = module.type
      }
    },
    {
      for name, module in module.virtual_machines :
      name => {
        vm_id      = module.vm_id
        hostname   = module.hostname
        ip_address = module.ip_address
        os         = module.os
        type       = module.type
      }
    }
  )
}

## tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) \(.value.ip_address)"' > inventory
## tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) static_ip=\(.value.ip_address | split("/")[0]) vmid=\(.value.vm_id) type=\(.value.type) os=\(.value.os)"' > inventory
