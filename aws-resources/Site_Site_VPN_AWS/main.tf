resource "aws_vpn_connection" "aws_side_vpn_connection" {
  customer_gateway_id      = var.customer_gateway_id
  vpn_gateway_id           = var.virtual_private_gateway_id
  local_ipv4_network_cidr  = var.local_network_cidr
  remote_ipv4_network_cidr = var.aws_side_cidr
  type                     = var.type_vpn_connection
}