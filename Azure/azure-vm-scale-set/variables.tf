variable "prefix" {
  type    = string
  default = "demo"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "rg_name" {
  type    = string
  default = "demo-rg"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}
