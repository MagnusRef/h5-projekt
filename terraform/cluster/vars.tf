# credentials imported as env vars
variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type = string
  default = "ns-vcs-01.l1-nak.local"
}
variable "vcs" {
  type = map
  default = {
    ds = "vsanDatastore"
    cl = "NS-CL-01"
    dc = "NS-DC-01"
    pg = "DMZ"
    tpl = "flatcar template"
  }
}