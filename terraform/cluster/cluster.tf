resource "vsphere_virtual_machine" "vm" {
  name             = "node"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 2048
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
      "guestinfo.ignition.config.data" = "eyJpZ25pdGlvbiI6eyJjb25maWciOnt9LCJzZWN1cml0eSI6eyJ0bHMiOnt9fSwidGltZW91dHMiOnt9LCJ2ZXJzaW9uIjoiMi4zLjAifSwibmV0d29ya2QiOnsidW5pdHMiOlt7ImNvbnRlbnRzIjoiW01hdGNoXVxuTmFtZT1lbnMxOTJcbltOZXR3b3JrXVxuREhDUD1ub1xuRE5TPTEuMS4xLjFcbkROUz04LjguOC44XG5bQWRkcmVzc11cbkFkZHJlc3M9MTkyLjE2OC4yLjIwLzI0XG5bUm91dGVdXG5EZXN0aW5hdGlvbj0wLjAuMC4wLzBcbkdhdGV3YXk9MTkyLjE2OC4yLjEgICAgXG4iLCJuYW1lIjoiMDAtdm13YXJlLm5ldHdvcmsifV19LCJwYXNzd2QiOnsidXNlcnMiOlt7Im5hbWUiOiJjb3JlIiwic3NoQXV0aG9yaXplZEtleXMiOlsic3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSURaMUZ0cFY3eVdPQ0IzQ1FiRG9BSERZU2FQT09HTUxzRzd0S2gyb0RlN0ogVGhpbmtwYWQgVDQ4MCJdfV19LCJzdG9yYWdlIjp7ImZpbGVzIjpbeyJmaWxlc3lzdGVtIjoiT0VNIiwicGF0aCI6Ii9ncnViLmNmZyIsImFwcGVuZCI6dHJ1ZSwiY29udGVudHMiOnsic291cmNlIjoiZGF0YTosc2V0JTIwbGludXhfYXBwZW5kJTNEJTIyJTI0bGludXhfYXBwZW5kJTIwZmxhdGNhci5hdXRvbG9naW4lM0R0dHkxJTIyJTBBIiwidmVyaWZpY2F0aW9uIjp7fX0sIm1vZGUiOjQyMH1dLCJmaWxlc3lzdGVtcyI6W3sibW91bnQiOnsiZGV2aWNlIjoiL2Rldi9kaXNrL2J5LWxhYmVsL09FTSIsImZvcm1hdCI6ImJ0cmZzIn0sIm5hbWUiOiJPRU0ifV19LCJzeXN0ZW1kIjp7InVuaXRzIjpbeyJkcm9waW5zIjpbeyJjb250ZW50cyI6IltTZXJ2aWNlXVxuRXhlY1N0YXJ0PVxuRXhlY1N0YXJ0PS0vc2Jpbi9hZ2V0dHkgLS1ub2NsZWFyICVJICRURVJNXG4iLCJuYW1lIjoiMTAtYXV0b2xvZ2luLmNvbmYifV0sIm5hbWUiOiJnZXR0eUAuc2VydmljZSJ9XX19"
      "guestinfo.ignition.config.data.encoding" = "base64"
    }
  }
}