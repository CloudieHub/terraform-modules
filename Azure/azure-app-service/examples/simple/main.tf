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

module "app_service" {
  source   = "../.."
  rg_name  = "demo-app-rg"
  location = "East US"
  app_name = "cloudiehub-app"

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }

  tags = {
    Project     = "cloudiehub"
    Environment = "demo"
  }
}

output "app_url" {
  value = module.app_service.app_service_url
}
