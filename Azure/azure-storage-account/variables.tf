variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Globally unique name for the Storage Account"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container"
  type        = string
  default     = "cloudiehub-container"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
