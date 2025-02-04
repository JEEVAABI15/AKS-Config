variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location/region for the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "The size of the Virtual Machines in the node pool"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the AKS cluster"
  type        = string
}

variable "zones" {
  description = "The Availability Zones for the AKS node pool"
  type        = list(string)
  default     = ["1", "2", "3"]  # Spread the nodes across 3 AZs
}

variable "auto_scaling" {
  description = "Whether auto-scaling is enabled for the node pool"
  type        = bool
  default     = true  # Enable auto-scaling (optional)
}

variable "min_node_count" {
  description = "The minimum number of nodes in the node pool when auto-scaling is enabled"
  type        = number
  default     = 1  # Minimum node count for scaling
}

variable "max_node_count" {
  description = "The maximum number of nodes in the node pool when auto-scaling is enabled"
  type        = number
  default     = 5  # Maximum node count for scaling
}


