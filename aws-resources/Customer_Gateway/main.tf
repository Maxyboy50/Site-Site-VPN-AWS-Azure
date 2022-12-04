resource "aws_customer_gateway" "site_site_customer_gateway" {
  bgp_asn     = var.bgp_asn
  ip_address  = var.customer_gateway_ip
  type        = var.type
  device_name = var.aws_customer_gateway_name
}