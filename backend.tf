terraform {
  backend "s3" {
    bucket = "mweitz-tfstate-remote"
    key = "site_site_aws_azure/test/terraform.tfstate"
    region = "us-east-2"
  }
  
}
