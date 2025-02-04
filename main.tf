resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "vnet" {
  source                = "./modules/vnet"
  vnet_name             = var.vnet_name
  address_space         = var.address_space
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  subnet_name      = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  nat_subnet_name      = var.nat_subnet_name
  nat_subnet_address_prefixes = var.nat_subnet_address_prefixes
  nsg_name             = var.nsg_name
  nat_gateway_id           = module.nat_gateway.nat_gateway_id  # Pass the NAT Gateway ID here

}

module "nat_gateway" {
  source                = "./modules/nat-gateway"
  nat_public_ip_name    = "aks-nat-public-ip"
  nat_gateway_name      = "aks-nat-gateway"
  nat_subnet_id         = module.vnet.nat_subnet_id  # Use the correct variable name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
}


module "route_table" {
  source              = "./modules/route-table"
  route_table_name    = "aks-route-table"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  aks_subnet_id       = module.vnet.subnet_id
  nat_gateway_public_ip = module.nat_gateway.nat_public_ip  # Corrected reference to the output
  environment         = "Production"
}


module "aks" {
  source                = "./modules/aks"
  aks_name              = var.aks_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  dns_prefix           = var.dns_prefix
  node_count           = var.node_count
  vm_size              = var.vm_size
  subnet_id            = module.vnet.subnet_id
}
