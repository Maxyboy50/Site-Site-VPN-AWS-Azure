output "subnet_id" {
  value = azurerm_subnet.azure_subnet_test.id
}

output "cidr_prefix" {
  value = azurerm_subnet.azure_subnet_test.address_prefixes
}