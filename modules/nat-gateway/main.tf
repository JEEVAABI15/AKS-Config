# Define a Public IP
resource "azurerm_public_ip" "nat_public_ip" {
  name                = var.nat_public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "Production"
  }
}

# Define a NAT Gateway
resource "azurerm_nat_gateway" "nat_gateway" {
  name                = var.nat_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Associate the Public IP with the NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_ip_association" {
  nat_gateway_id      = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = azurerm_public_ip.nat_public_ip.id
}

# Associate the NAT Gateway with a Subnet
resource "azurerm_subnet_nat_gateway_association" "subnet_nat_gateway_association" {
  subnet_id      = var.nat_subnet_id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}
