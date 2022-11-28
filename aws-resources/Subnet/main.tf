resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.1.0/24"

  tags = {
    Purpose = "AWS_to_Azure_VPN_Test"
  }
}