variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "admin_username" {
  description = "Administrator username"
  type        = string
}

variable "admin_password" {
  description = "Administrator password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "SQL Database name"
  type        = string
}

variable "sku_name" {
  description = "Pricing tier (example: GP_Gen5_2)"
  type        = string
  default     = "GP_Gen5_2"
}

variable "max_size_gb" {
  description = "Maximum database size in GB"
  type        = number
  default     = 5
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
