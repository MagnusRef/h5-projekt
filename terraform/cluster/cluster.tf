resource "vsphere_virtual_machine" "vm" {
  for_each = {for vm in var.vms: vm.hostname => vm}
  
  name             = "${each.value.hostname}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  
  num_cpus         = each.value.cpu
  memory           = each.value.ram
  
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  
  vapp {
    properties = {
      "guestinfo.ignition.config.data" = base64encode(data.ct_config.ignition["${each.value.hostname}"].rendered)
      "guestinfo.ignition.config.data.encoding" = "base64"
    }
  }
}
