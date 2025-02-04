output "route_table_id" {
  description = "The ID of the created route table"
  value       = azurerm_route_table.aks_route_table.id
}

output "nat_public_ip_output" {
  value = var.nat_gateway_public_ip
}
