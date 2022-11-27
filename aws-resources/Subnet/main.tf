resource "aws_subnet" "main" {
  vpc_id     = var.vpc-id
  cidr_block = "10.0.1.0/24"

  tags = {
    Purpose = "AWS-Azure VPN Test"
  }
}