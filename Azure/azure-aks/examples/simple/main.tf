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

module "aks" {
  source    = "../.."
  rg_name   = "demo-aks-rg"
  location  = "East US"
  aks_name  = "cloudiehub-aks"
  node_count = 2
  vm_size   = "Standard_DS2_v2"

  tags = {
    Project     = "cloudiehub"
    Environment = "demo"
  }
}

output "kube_config" {
  value     = module.aks.aks_kube_config
  sensitive = true
}
