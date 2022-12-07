#Azure Modules

module "resource_group" {
  source                  = "./azure-resources/Resource_Group"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

}
module "VNET" {
  source              = "./azure-resources/VNET"
  depends_on          = [module.resource_group]
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

module "subnet_azure" {
  for_each = {
    "GatewaySubnet" = ["172.31.1.0/24"]
    "VM_Subnet"     = ["172.31.2.0/24"]
  }
  source                = "./azure-resources/Subnet"
  depends_on            = [module.resource_group]
  subnet_name           = each.key
  resource_group_name   = var.resource_group_name
  virtual_network_name  = module.VNET.vnet_name
  cidr_notation_subnets = each.value

}

module "ip_address_azure" {
  source              = "./azure-resources/Public_IP"
  depends_on          = [module.resource_group]
  public_ip_name      = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

module "virtual_network_gateway" {
  source                       = "./azure-resources/Virtual_Network_Gateway"
  depends_on                   = [module.resource_group]
  virtual_network_gateway_name = var.virtual_network_gateway_name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  public_ip_address_id         = module.ip_address_azure.public_ip_address_id
  subnet_id                    = module.subnet_azure["GatewaySubnet"].subnet_id
}

#AWS Modules

module "VPC" {
  source         = "./aws-resources/VPC"
  vpc_cidr_block = var.vpc_cidr_block
}

module "subnet_aws" {
  source         = "./aws-resources/Subnet"
  cidr_block_aws = var.cidr_block_aws
  vpc_id         = module.VPC.vpc_id
}

module "virtual_private_gateway" {
  source         = "./aws-resources/Virtual_Private_Gateway"
  vpc_attachment = module.VPC.vpc_id
}

module "aws_customer_gateway" {
  depends_on                = [module.virtual_network_gateway]
  source                    = "./aws-resources/Customer_Gateway"
  customer_gateway_ip       = module.ip_address_azure.ip_address
  aws_customer_gateway_name = var.aws_customer_gateway_name

}


module "aws_side_vpn_connection" {
  source                     = "./aws-resources/Site_Site_VPN_AWS"
  customer_gateway_id        = module.aws_customer_gateway.customer_gateway_id
  virtual_private_gateway_id = module.virtual_private_gateway.virtual_private_gateway_id
  aws_side_cidr              = var.aws_side_cidr
  local_network_cidr         = var.local_network_cidr
}