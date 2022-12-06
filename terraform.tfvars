###################AWS Variables######################
aws_customer_gateway_name = "Azure_Virtual_Private_Gateway"

local_network_cidr = "172.31.0.0/16"

aws_side_cidr = "10.0.0.0/16"

cidr_block_aws = "10.0.1.0/24"

vpc_cidr_block = "10.0.0.0/16"
###################Azure Variables####################
resource_group_name = "Site_Site_VPN_AWS_Azure"

vnet_name = "AWS_Azure_VNET_Test"

vnet_address_space = ["172.31.0.0/16"]

public_ip_name = "Azure_VNG_Public_IP"

virtual_network_gateway_name = "Azure_VPG"