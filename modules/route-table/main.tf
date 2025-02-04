# Create Route Table
resource "azurerm_route_table" "aks_route_table" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = var.environment
  }
}

# Create a Route in the Route Table
resource "azurerm_route" "default_internet_route" {
  name                   = "default-internet-route"
  route_table_name       = azurerm_route_table.aks_route_table.name
  resource_group_name    = var.resource_group_name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "Internet"  # No need for next_hop_in_ip_address when using Internet
}

# Associate Route Table with AKS Subnet
resource "azurerm_subnet_route_table_association" "aks_subnet_route_table_association" {
  subnet_id      = var.aks_subnet_id
  route_table_id = azurerm_route_table.aks_route_table.id
}
