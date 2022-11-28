resource "azurerm_virtual_network" "aws_azure_test"{
    name = "site_to_site_vpn_test"
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = ["10.0.0.0/16"]
}