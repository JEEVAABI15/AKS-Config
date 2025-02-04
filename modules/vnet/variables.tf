variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "The address space of the Virtual Network"
  type        = list(string)
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "subnet_name" {
  description = "The name of the AKS subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the AKS subnet"
  type        = list(string)
}

variable "nat_subnet_name" {
  description = "The name of the NAT Gateway subnet"
  type        = string
}

variable "nat_subnet_address_prefixes" {
  description = "The address prefixes for the NAT Gateway subnet"
  type        = list(string)
}

variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "The location for the virtual network and related resources"
  type        = string
}

variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  type        = string
}
