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

module "azure_vnet" {
  source = "../.."

  resource_group_name = "cloudiehub-rg"
  location            = "East US"

  vnet_name      = "cloudiehub-vnet"
  address_space  = ["10.0.0.0/16"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

  tags = {
    Project     = "CloudieHub"
    Environment = "demo"
  }
}

output "vnet_id" {
  value = module.azure_vnet.vnet_id
}

output "public_subnets" {
  value = module.azure_vnet.subnet_ids_public
}

output "private_subnets" {
  value = module.azure_vnet.subnet_ids_private
}
