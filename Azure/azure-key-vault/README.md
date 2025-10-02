# Azure Key Vault Module (CloudieHub)

This Terraform module provisions an **Azure Key Vault** and stores a **secret** inside it.  
Useful for securely managing application credentials, API keys, and other sensitive data.

---

## Features
- Creates an **Azure Key Vault** with soft-delete and purge protection enabled.  
- Stores a **secret** inside the vault.  
- Configurable names, location, and tags.  

---

## Resources Created
- `azurerm_resource_group` – Resource Group  
- `azurerm_key_vault` – Azure Key Vault  
- `azurerm_key_vault_secret` – Secret stored in the Key Vault  

---

## Inputs
| Name            | Description                          | Type   | Default       |
|-----------------|--------------------------------------|--------|---------------|
| `rg_name`       | Name of the Resource Group           | string | n/a           |
| `location`      | Azure region                         | string | `"East US"`   |
| `key_vault_name`| Globally unique name for Key Vault   | string | n/a           |
| `tenant_id`     | Azure AD Tenant ID                   | string | n/a           |
| `secret_name`   | Secret name                          | string | `"demo-secret"` |
| `secret_value`  | Secret value (sensitive)             | string | n/a           |
| `tags`          | Tags to apply                        | map    | `{}`          |

---

## Outputs
| Name            | Description                       |
|-----------------|-----------------------------------|
| `key_vault_id`  | ID of the Key Vault               |
| `key_vault_uri` | URI endpoint of the Key Vault     |
| `secret_id`     | ID of the stored secret           |

---

## Usage
See [examples/simple](./examples/simple) for usage.

```hcl
module "key_vault" {
  source         = "CloudieHub/terraform-modules/Azure/azure-key-vault"
  rg_name        = "demo-kv-rg"
  location       = "East US"
  key_vault_name = "cloudiehub-kv123"
  tenant_id      = "00000000-0000-0000-0000-000000000000"
  secret_name    = "db-password"
  secret_value   = "SuperSecureP@ssword123!"
}
