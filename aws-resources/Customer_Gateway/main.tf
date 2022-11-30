resource "aws_customer_gateway" "site_site_customer_gateway" {
  bgp_asn    = 65000
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"
  device_name       = var.aws_customer_gateway_name
}