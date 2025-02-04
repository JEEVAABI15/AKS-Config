variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "aks_subnet_id" {
  description = "Subnet ID for the AKS cluster"
  type        = string
}

variable "nat_gateway_public_ip" {
  description = "Public IP address of the NAT Gateway"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "Production"
}
