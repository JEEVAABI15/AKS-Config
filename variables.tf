# Resource Group Variables
variable "rg_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created."
}

# VNet Module Variables
variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network."
}

variable "subnet_name" {
  type        = string
  description = "Name of the primary subnet."
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the primary subnet."
}

variable "nat_subnet_name" {
  type        = string
  description = "Name of the primary subnet."
}

variable "nat_subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the primary subnet."
}


variable "nsg_name" {
  type        = string
  description = "The name of the nsg"
}

# AKS Module Variables
variable "aks_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix for the AKS cluster."
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the AKS cluster."
}

variable "vm_size" {
  type        = string
  description = "The size of the VM for the AKS cluster nodes."
}
