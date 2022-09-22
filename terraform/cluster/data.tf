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
  content = templatefile("${path.module}/ignition.yaml.tftpl",{
    hostname = "DAC"
    ipv4 = "192.168.2.22/24"
    gw4 = "192.168.2.1"
    dns1 = "1.1.1.1"
    dns2 = "8.8.8.8"
  })
}