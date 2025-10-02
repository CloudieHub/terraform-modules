output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_ids_public" {
  value = azurerm_subnet.public[*].id
}

output "subnet_ids_private" {
  value = azurerm_subnet.private[*].id
}
