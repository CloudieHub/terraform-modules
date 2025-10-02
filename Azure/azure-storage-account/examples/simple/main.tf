terraform {
  required_version = ">= 1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "storage" {
  source = "../.."

  rg_name              = "demo-storage-rg"
  location             = "East US"
  storage_account_name = "cloudiehubstorage123" # must be globally unique
  container_name       = "demo-container"
  tags = {
    Project     = "cloudiehub"
    Environment = "demo"
  }
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "primary_blob_endpoint" {
  value = module.storage.primary_blob_endpoint
}
