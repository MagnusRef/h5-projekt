data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "cluster"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = "192.168.2.11"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "flatcar-template"
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