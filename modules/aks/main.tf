resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                    = "default"
    node_count              = var.node_count  # Set the desired number of nodes
    vm_size                 = var.vm_size     # Set the VM size for the nodes
    vnet_subnet_id          = var.subnet_id    # Subnet where the nodes will reside
    zones      = var.zones  # List of AZs to deploy the nodes across

    # Optional configurations like scaling behavior and auto-scaling
    auto_scaling_enabled     = var.auto_scaling
    min_count               = var.min_node_count  # Minimum number of nodes
    max_count               = var.max_node_count  # Maximum number of nodes

    type   = "VirtualMachineScaleSets"  
    enable_auto_scaling = true
    min_count = 1
    max_count = 5   
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = "10.100.0.0/16"  # CIDR range for services within the AKS cluster
    dns_service_ip     = "10.100.0.10"    # DNS IP for the AKS services
  }

  tags = {
    environment = "Production"
  }
}
