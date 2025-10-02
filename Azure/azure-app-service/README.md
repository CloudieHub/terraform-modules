# Azure App Service Module (CloudieHub)

This Terraform module provisions an **Azure App Service** and an **App Service Plan** to deploy scalable web applications.

---

## Features
- Creates a **Linux App Service Plan**  
- Deploys an **App Service** with optional Docker/Linux runtime  
- Supports **App Settings** (environment variables)  
- Outputs **App Service URL**  

---

## Resources Created
- `azurerm_resource_group` – Resource Group  
- `azurerm_app_service_plan` – App Service Plan  
- `azurerm_app_service` – Web App  

---

## Inputs
| Name           | Description                     | Type   | Default   |
|----------------|---------------------------------|--------|-----------|
| `rg_name`      | Resource group name             | string | n/a       |
| `location`     | Azure region                    | string | "East US" |
| `app_name`     | Name of the App Service         | string | n/a       |
| `app_settings` | App settings (env variables)    | map    | `{}`      |
| `tags`         | Tags to apply                   | map    | `{}`      |

---

## Outputs
| Name              | Description                    |
|-------------------|--------------------------------|
| `app_service_name` | Name of the App Service        |
| `app_service_url`  | Default URL of the web app     |

---

## Usage
See [examples/simple](./examples/simple).

```hcl
module "app_service" {
  source   = "CloudieHub/terraform-modules/Azure/azure-app-service"
  rg_name  = "demo-app-rg"
  location = "East US"
  app_name = "cloudiehub-app"
}
