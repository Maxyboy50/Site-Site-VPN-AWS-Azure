variable "virtual_network_gateway_name"{
  description = "Name to assign to virtual network gateway"
  type = string
}
variable "location" {
  description = "Location to build the virtual network gateway in"
  type = string
  default = "East US"
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