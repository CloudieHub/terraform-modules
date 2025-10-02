variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "key_vault_name" {
  description = "Globally unique name for the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory Tenant ID"
  type        = string
}

variable "secret_name" {
  description = "Name of the secret to store"
  type        = string
  default     = "demo-secret"
}

variable "secret_value" {
  description = "Value of the secret"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
