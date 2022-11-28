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
  for_each = toset(["10.0.1.0/24","10.0.2.0/24"])
  source                = "./azure-resources/Subnet"
  subnet_name = "${each.value}-subnet"
  resource_group_name   = module.resource_group.resource_group_name
  virtual_network_name  = module.VNET.vnet_name
  cidr_notation_subnets = ["${each.value}"]

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
  subnet_id           = module.subnet_azure["10.0.1.0/24"].subnet_id
  public_ip_address   = module.ip_address_azure.ip_address

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