output "nodes" {
    value = var.vms[*]
}

output "ssh" {
    value = [
        for vm in var.vms : "ssh core@${vm.fqdn}"
    ]
}