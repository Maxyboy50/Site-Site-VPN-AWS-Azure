resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.5.0/24"

  tags = {
    Purpose = "AWS_to_Azure_VPN_Test"
  }
}