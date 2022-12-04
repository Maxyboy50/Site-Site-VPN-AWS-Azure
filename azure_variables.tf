######General Variables##########
variable "resource_group_name" {
  description = "Name of the resource group this resources will belong to"
  type        = string
}
variable "resource_group_location" {
  description = "Location the resources will belong to"
  type        = string
  default     = "East US"
}

########VNET Variables############
variable "vnet_name" {
  description = "Name that will be assigned to VNET"
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR of address block that will be assigned to VNET"
  type        = list(string)
}

#########Virtual Network Gateway Variables###############
variable "virtual_network_gateway_name" {
  description = "Name to assign to virtual network gateway"
  type        = string
}

###########Azure Subnet Variables##############
#variable "cidr_notation_subnets" {
#  description = "CIDR notation of the address block(s) the subnet will contain"
#  type        = map(string)
#}

#########Public IP Azure Variables#################
variable "public_ip_name" {
  description = "Name that will be assigned to public_ip"
  type        = string
}

variable "allocation_method" {
  description = "Determines whether IP address will be generated upon resource creation or assignment to another resource"
  type        = string
  default     = "Dynamic"
}