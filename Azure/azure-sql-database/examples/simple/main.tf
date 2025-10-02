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

module "sql_db" {
  source          = "../.."
  rg_name         = "demo-sql-rg"
  location        = "East US"
  sql_server_name = "cloudiehub-sqlserver"
  admin_username  = "sqladminuser"
  admin_password  = "SuperStrongP@ssw0rd!"
  database_name   = "cloudiehubdb"
  sku_name        = "GP_Gen5_2"
  max_size_gb     = 10
  tags = {
    Project     = "cloudiehub"
    Environment = "demo"
  }
}

output "sql_server_fqdn" {
  value = module.sql_db.sql_server_fqdn
}
