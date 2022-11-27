resource "azurerm_virtual_network" "aws-azure-test"{
    name = "site-to-site-vpn-test"
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = ["10.0.0.0/16"]
}