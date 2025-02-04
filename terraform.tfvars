# Root variables
rg_name          = "aks-grp"
location         = "Central India"

# VNet Module variables
vnet_name        = "aks-vnet"
address_space    = ["10.0.0.0/8"]
subnet_name      = "aks-subnet"
subnet_address_prefixes = ["10.240.0.0/16"]
nat_subnet_name    = "nat-subnet"
nat_subnet_address_prefixes = ["10.0.2.0/24"]

# AKS Module variables
aks_name         = "aks-cluster"
dns_prefix       = "aksdns"
node_count       = 2
vm_size          = "Standard_DS2_v2"

nsg_name = "aks-nsg"