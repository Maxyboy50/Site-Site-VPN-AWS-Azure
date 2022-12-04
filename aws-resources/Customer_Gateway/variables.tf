variable "customer_gateway_ip" {
  description = "The IP address of the customer gateway device"
  type        = string
}

variable "aws_customer_gateway_name" {
  description = "Name to assign the Customer Gateway Device (e.g. Client-1-Customer-Gateway"
  type        = string
}

variable "bgp_asn" {
  description = "BGP of the customer gateway device (default will typically work)"
  type        = number
  default     = 65000
}

variable "type_customer_gateway" {
  description = "VPN connection type for Customer Gateway"
  type        = string
  default     = "ipsec.1"
}