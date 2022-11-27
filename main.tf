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

module "subnet-azure" {
  source = "./azure-resources/Subnet"
  resource_group_name = module.resource_group.resource_group_name
  virtual_network_name = module.VNET.vnet_name
}


#AWS Modules

module "VPC" {
  source = "./aws-resources/VPC"
}

module "subnet-aws" {
  source = "./aws-resources/Subnet"
  vpc-id = module.VPC.vpc-id
}

module "virtual-private-gateway" {
    source = "./aws-resources/Virtual-Private-Gateway"
    vpc-attachment = module.VPC.vpc-id
}