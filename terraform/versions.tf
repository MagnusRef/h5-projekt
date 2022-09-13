terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.22.0"
    }
  }

  /*
  backend "s3" {
	  bucket = "h5-projekt-tfstate"
		key = "terraform.tfstate"
		region = "eu-north-1"
	}
  */
  required_version = ">= 1.2.0"
}

provider "azurerm" {
  features {}
}