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
  backend "azurerm" {
    resource_group_name  = "l1-nak-tf-backend-rg"
    storage_account_name = "nakskovtfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
