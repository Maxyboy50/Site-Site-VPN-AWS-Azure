resource "azurerm_subnet" "azure_subnet_test" {
  name                 = "azure_vpn_vm_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes    = var.cidr_notation_subnets
}