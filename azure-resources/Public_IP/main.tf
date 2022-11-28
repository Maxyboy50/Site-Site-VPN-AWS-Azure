resource "azurerm_public_ip" "site_site_public_ip" {
  name                = "azure_side_public_ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}