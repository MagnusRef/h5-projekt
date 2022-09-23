output "ip" {
  value = var.vms[*].ip
}

output "ssh" {
  value = [
    for vm in var.vms : "ssh core@${vm.fqdn}"
  ]
}