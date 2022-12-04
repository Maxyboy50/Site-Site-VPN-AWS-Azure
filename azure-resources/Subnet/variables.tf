variable "resource_group_name" {
  description = "Name of the resource group this subnet will be provisioned in"
  type = string
}
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