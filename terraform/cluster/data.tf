data "vsphere_datacenter" "datacenter" {
  name = var.vcs.dc
}

data "vsphere_datastore" "datastore" {
  name          = var.vcs.ds
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vcs.cl
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vcs.pg 
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vcs.tpl 
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "ct_config" "ignition" {
  for_each = {for vm in var.vms: vm.hostname => vm}
  content = templatefile("${path.module}/ignition.yaml.tftpl",{
    hostname = "${each.value.hostname}"
    ipv4 = "${each.value.ip}"
    gw4 = "${each.value.gw}"
    dns1 = "${each.value.dns1}"
    dns2 = "${each.value.dns2}"
  })
}