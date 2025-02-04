variable "nat_public_ip_name" {
  description = "Name of the Public IP"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region for Resources"
  type        = string
}

variable "nat_subnet_id" {
  description = "The ID of the subnet where the NAT Gateway will be attached"
  type        = string
}
