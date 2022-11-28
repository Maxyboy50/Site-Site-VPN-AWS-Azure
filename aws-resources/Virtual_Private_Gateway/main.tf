resource "aws_vpn_gateway" "terraform_vpn_gateway" {

  vpc_id = var.vpc_attachment
}