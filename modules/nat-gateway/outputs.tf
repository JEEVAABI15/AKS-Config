# Output for NAT Gateway ID


# Output the Public IP address of the NAT Gateway
output "nat_public_ip" {
  value = azurerm_public_ip.nat_public_ip.ip_address
}

output "nat_gateway_id" {
  value = azurerm_nat_gateway.nat_gateway.id
}
