output "tunnel_1_ip" {
  value = aws_vpn_connection.aws_side_vpn_connection.tunnel1_address
}

output "tunnel_1_key" {
  value = aws_vpn_connection.aws_side_vpn_connection.tunnel1_preshared_key
}