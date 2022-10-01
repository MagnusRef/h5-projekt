# h5-projekt
TEC Ballerup - Datatekniker med speciale i infrastruktur - H5 projekt cloud

on-prem kubernetes using the following:
* Terraform - for provisioning VMs in Vsphere.
* S3 - as remote backend for terraform.
* Flatcar linux - OS for the nodes
* Mozilla SOPS - secret encryption with age
* Kubespray - for creating a kubernetes cluster.
* MetalLB - for loadbalancing
* TBA