terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.41.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }
}
#Configure AWS Provider
provider "aws" {
  region = "us-east-2"
}


#Configure Azure Provider
provider "azurerm" {
  features {}
}

#Azure Modules

module "resource_group" {
  source = "./azure-resources/Resource_Group"
}
module "VNET" {
  source              = "./azure-resources/VNET"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
}

module "subnet_azure" {
  for_each = {
    "GatewaySubnet" = ["10.0.1.0/24"]
    "VM_Subnet"     = ["10.0.2.0/24"]
  }
  source                = "./azure-resources/Subnet"
  subnet_name           = each.key
  resource_group_name   = module.resource_group.resource_group_name
  virtual_network_name  = module.VNET.vnet_name
  cidr_notation_subnets = each.value

}

module "ip_address_azure" {
  source              = "./azure-resources/Public_IP"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
}

module "virtual_network_gateway" {
  source              = "./azure-resources/Virtual_Network_Gateway"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  public_ip_address_id   = module.ip_address_azure.public_ip_address_id
  subnet_id           = module.subnet_azure["GatewaySubnet"].subnet_id
}

#AWS Modules

module "VPC" {
  source = "./aws-resources/VPC"
}

module "subnet_aws" {
  source = "./aws-resources/Subnet"
  vpc_id = module.VPC.vpc_id
}

module "virtual_private_gateway" {
  source         = "./aws-resources/Virtual_Private_Gateway"
  vpc_attachment = module.VPC.vpc_id
}

module "aws_customer_gateway" {
  source                    = "./aws-resources/Customer_Gateway"
  customer_gateway_ip       = module.ip_address_azure.ip_address
  aws_customer_gateway_name = "site_site_aws_customer_gateway"
}

module "aws_side_vpn_connection" {
  source                     = "./aws-resources/Site_Site_VPN_AWS"
  customer_gateway_id        = module.aws_customer_gateway.customer_gateway_id
  virtual_private_gateway_id = module.virtual_private_gateway.virtual_private_gateway_id
  aws_side_cidr              = "10.0.5.0/24"
  azure_side_cidr            = "10.0.1.0/24"
}