resource "azurerm_resource_group" "sitetositetest" {

  name     = var.resource_group_name
  location = var.resource_group_location
}