variable "instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
}

variable "database_version" {
  description = "The database version (MYSQL_8_0, POSTGRES_14, SQLSERVER_2019_STANDARD, etc.)"
  type        = string
}

variable "region" {
  description = "Region for the instance"
  type        = string
}

variable "tier" {
  description = "The machine type tier (e.g. db-f1-micro, db-g1-small, db-n1-standard-1)"
  type        = string
}

variable "ipv4_enabled" {
  description = "Whether public IPv4 access is enabled"
  type        = bool
  default     = false
}

variable "private_network" {
  description = "The VPC network for private IP"
  type        = string
  default     = null
}

variable "authorized_networks" {
  description = "List of authorized networks for public IP"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "backup_enabled" {
  description = "Enable backups"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "database_name" {
  description = "Default database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
}
