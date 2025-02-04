# Output for VNet ID and Subnet ID
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nat_subnet_id" {
  value = azurerm_subnet.nat_subnet.id
}