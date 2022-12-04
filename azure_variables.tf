######General Variables##########
variable "resource_group_name" {
  description = "Name of the resource group this VNET will belong to"
  type = string
}
variable "location" {
  description = "Location the resources will belong to"
  type = string
  default = "East US"
}

########VNET Variables############
variable "vnet_name"{
  description = "Name that will be assigned to VNET"
  type = string
}

variable "vnet_address_space"{
  description = "CIDR of address block that will be assigned to VNET"
  type = list(string)
}

#########Virtual Network Gateway Variables###############
variable "virtual_network_gateway_name"{
  description = "Name to assign to virtual network gateway"
  type = string
}
variable "subnet_id" {
  description = "Subnet that the virtual network gateway will be built in"
  type = string
}
variable "resource_group_name" {
  description = "Name of the resource group the virtual network gateway will belong to"
  type = string
}
variable "public_ip_address_id" {
  description = "IP address that will be assigned to the virtual network gateway"
  type = string
}

###########Azure Subnet Variables##############
variable "virtual_network_name" {
  description = "Name of the VNET this subnet will be built in"
  type = string
}
variable "cidr_notation_subnets" {
  description = "CIDR notation of the address block(s) the subnet will contain"
  type = list(string)
}
variable "subnet_name" {
  description  = "Name that will be assigned to the subnet"
  type = string
}

########Resource Group Variables###################
variable "resource_group_location"{
    description = "Location to build the resource group in"
    type = string
    default = "East US"
}

#########Public IP Azure Variables#################
variable "public_ip_name" {
  description = "Name that will be assigned to public_ip"
  type = string
}

variable "allocation_method"{
  description = "Determines whether IP address will be generated upon resource creation or assignment to another resource"
  type = string
  default = "Dynamic"
}