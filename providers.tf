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