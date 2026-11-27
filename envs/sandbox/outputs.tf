output "vcn_id" {
  value = module.network.vcn_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "vm_private_ip" {
  value = module.app_vm.private_ip
}

output "vm_id" {
  value = module.app_vm.instance_id
}
