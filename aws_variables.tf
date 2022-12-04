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

##################VPN Connection Variables#######################
variable "local_network_cidr" {
  description = "CIDR block of local network that is allowed to communicate through VPN"
  type        = string
}

variable "aws_side_cidr" {
  description = "CIDR block of aws resources that are allowed to communicate through VPN"
  type        = string
}

variable "type_vpn_connection" {
  description = "VPN connection type for site-site resource"
  type        = string
  default     = "ipsec.1"
}

#####################Subnet Variables#######################
variable "cidr_block_aws" {
  description = "CIDR notation for subnet"
  type        = string

}

variable "tags" {
  description = "Tags to associate with resource"
  type        = map(string)
  default     = {}

}

####################Virtual Private Gateway Variables#########################

#####################Virtual Private Cloud Variables##########################
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR notation block to use for VPC"
}
