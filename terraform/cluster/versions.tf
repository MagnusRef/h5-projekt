terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.2.0"
    }
    ct = {
      source  = "poseidon/ct"
      version = "0.11.0"
    }
  }
  backend "s3" {
    bucket    = "l1-nak-terraform-backend"
    key       = "terraform.tfstate"
    region    = "eu-north-1"
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
