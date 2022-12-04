variable "customer_gateway_id" {
  description = "ID of customer_gateway to attach to site-site-vpn-connection"
  type = string
}

variable "virtual_private_gateway_id" {
  description = "ID of VPG to attach to site-site-vpn-connection"
  type = string
}

variable "local_network_cidr" {
  description = "CIDR block of local network that is allowed to communicate through VPN"
  type = string
}

variable "aws_side_cidr" {
  description = "CIDR block of aws resources that are allowed to communicate through VPN"
  type = string
}

variable "type_vpn_connection" {
  description = "VPN connection type for site-site resource"
  type = string
  default = "ipsec.1"
}