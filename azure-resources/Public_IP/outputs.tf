output "ip_address" {
  value = azurerm_public_ip.site_site_public_ip.ip_address
}

output "public_ip_address_id" {
  value = azurerm_public_ip.site_site_public_ip.id
}
