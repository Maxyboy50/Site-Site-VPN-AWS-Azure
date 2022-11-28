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
provider "azurerm"{
  features {}
}

#Azure Modules

module "resource_group"{
  source = "./azure-resources/Resource_Group"
}
module "VNET" {
  source = "./azure-resources/VNET"
  location = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
}

module "subnet_azure" {
  source = "./azure-resources/Subnet"
  resource_group_name = module.resource_group.resource_group_name
  virtual_network_name = module.VNET.vnet_name
  count = 2
}

module "ip_address_azure"{
  source = "./azure-resources/Public_IP"
  resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.resource_group_location
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
    source = "./aws-resources/Virtual_Private_Gateway"
    vpc_attachment = module.VPC.vpc_id
}