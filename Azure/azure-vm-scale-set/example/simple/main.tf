terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "vmss" {
  source = "../../"   # points to module root

  prefix          = "demo"
  location        = "East US"
  rg_name         = "demo-rg"
  vm_size         = "Standard_B2s"
  instance_count  = 2
  admin_username  = "azureuser"
  admin_password  = "StrongPassword123!"
}
