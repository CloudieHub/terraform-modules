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

module "key_vault" {
  source          = "../.."
  rg_name         = "demo-kv-rg"
  location        = "East US"
  key_vault_name  = "cloudiehub-kv123"
  tenant_id       = "00000000-0000-0000-0000-000000000000" # Replace with your Azure AD Tenant ID
  secret_name     = "db-password"
  secret_value    = "SuperSecureP@ssword123!"
  tags = {
    Project     = "cloudiehub"
    Environment = "demo"
  }
}

output "key_vault_uri" {
  value = module.key_vault.key_vault_uri
}
