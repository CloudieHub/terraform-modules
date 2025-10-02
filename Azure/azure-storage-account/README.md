# Azure Storage Account Module (CloudieHub)

This Terraform module provisions an **Azure Storage Account** with a **Blob Container**.  
Useful for storing application data, media files, backups, and logs.

---

## Features
- Creates a **Storage Account** (Standard LRS by default).  
- Creates a **Blob Container** (private access by default).  
- Supports tags for resource organization.  

---

## Resources Created
- `azurerm_resource_group` – Resource Group  
- `azurerm_storage_account` – Storage Account  
- `azurerm_storage_container` – Blob Container  

---

## Inputs
| Name                   | Description                          | Type   | Default               |
|------------------------|--------------------------------------|--------|-----------------------|
| `rg_name`              | Name of the Resource Group           | string | n/a                   |
| `location`             | Azure region                         | string | `"East US"`           |
| `storage_account_name` | Globally unique storage account name | string | n/a                   |
| `container_name`       | Blob container name                  | string | `"cloudiehub-container"` |
| `tags`                 | Tags to apply to resources           | map    | `{}`                  |

---

## Outputs
| Name                  | Description                     |
|-----------------------|---------------------------------|
| `storage_account_id`  | ID of the Storage Account       |
| `storage_account_name`| Name of the Storage Account     |
| `container_id`        | ID of the Blob Container        |
| `primary_blob_endpoint` | Primary blob service endpoint |

---

## Usage
See [examples/simple](./examples/simple) for usage.

```hcl
module "storage" {
  source              = "CloudieHub/terraform-modules/Azure/azure-storage-account"
  rg_name             = "demo-storage-rg"
  location            = "East US"
  storage_account_name= "cloudiehubstorage123"
  container_name      = "demo-container"
}
