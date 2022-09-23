# credentials imported as env vars
variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type    = string
  default = "ns-vcs-01.l1-nak.local"
}
variable "vcs" {
  type = map(any)
  default = {
    ds  = "vsanDatastore"
    cl  = "NS-CL-01"
    dc  = "NS-DC-01"
    pg  = "DMZ"
    tpl = "flatcar template"
  }
}

variable "vms" {
  type = list(any)
  default = [
    {
      hostname = "NS-K8SCPL-01"
      fqdn     = "ns-k8scpl-01.l1-nak.local"
      cpu      = 2
      ram      = 2048
      ip       = "10.2.100.10/24"
      gw       = "10.2.100.1"
      dns1     = "10.2.90.10"
      dns2     = "10.2.90.11"
    },
    {
      hostname = "NS-K8SWRK-01"
      fqdn     = "ns-k8swrk-01.l1-nak.local"
      cpu      = 4
      ram      = 4096
      ip       = "10.2.100.11/24"
      gw       = "10.2.100.1"
      dns1     = "10.2.90.10"
      dns2     = "10.2.90.11"
    },
    {
      hostname = "NS-K8SWRK-02"
      fqdn     = "ns-k8swrk-02.l1-nak.local"
      cpu      = 4
      ram      = 4096
      ip       = "10.2.100.12/24"
      gw       = "10.2.100.1"
      dns1     = "10.2.90.10"
      dns2     = "10.2.90.11"
    },
    {
      hostname = "NS-K8SWRK-03"
      fqdn     = "ns-k8swrk-03.l1-nak.local"
      cpu      = 4
      ram      = 4096
      ip       = "10.2.100.13/24"
      gw       = "10.2.100.1"
      dns1     = "10.2.90.10"
      dns2     = "10.2.90.11"
    }
  ]
}