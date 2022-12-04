variable "resource_group_name" {
  description = "Name of the resource group this VNET will belong to"
  type        = string
}
variable "location" {
  description = "Location this VNET will belong to"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name that will be assigned to VNET"
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR of address block that will be assigned to VNET"
  type        = list(string)
}