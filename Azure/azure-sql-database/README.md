# Azure SQL Database Module (CloudieHub)

This Terraform module provisions an **Azure SQL Database** (PaaS) with an associated **SQL Server**.

---

## Features
- Deploys **SQL Server** in Azure  
- Creates a **SQL Database** with configurable SKU and size  
- Sets up a **default firewall rule** allowing Azure services  
- Configurable admin credentials, names, and tags  

---

## Resources Created
- `azurerm_resource_group` – Resource Group  
- `azurerm_mssql_server` – SQL Server  
- `azurerm_mssql_database` – SQL Database  
- `azurerm_mssql_firewall_rule` – Firewall rule (Allow Azure Services)  

---

## Inputs
| Name             | Description                         | Type   | Default     |
|------------------|-------------------------------------|--------|-------------|
| `rg_name`        | Resource group name                 | string | n/a         |
| `location`       | Azure region                        | string | `"East US"` |
| `sql_server_name`| SQL Server name                     | string | n/a         |
| `admin_username` | Administrator username              | string | n/a         |
| `admin_password` | Administrator password (sensitive)  | string | n/a         |
| `database_name`  | Database name                       | string | n/a         |
| `sku_name`       | Pricing tier (e.g., GP_Gen5_2)      | string | `"GP_Gen5_2"` |
| `max_size_gb`    | Maximum database size in GB         | number | `5`         |
| `tags`           | Tags to apply                       | map    | `{}`        |

---

## Outputs
| Name              | Description                      |
|-------------------|----------------------------------|
| `sql_server_name` | SQL Server name                  |
| `sql_server_fqdn` | Fully qualified domain name (FQDN)|
| `database_name`   | SQL Database name                |

---

## Usage
See [examples/simple](./examples/simple).

```hcl
module "sql_db" {
  source          = "CloudieHub/terraform-modules/Azure/azure-sql-database"
  rg_name         = "demo-sql-rg"
  location        = "East US"
  sql_server_name = "cloudiehub-sqlserver"
  admin_username  = "sqladminuser"
  admin_password  = "SuperStrongP@ssw0rd!"
  database_name   = "cloudiehubdb"
}
