#create a VPC to build the Security Groups in - don't assume there will be a default
resource "aws_vpc" "vpc_security_group_lab" {
  cidr_block = var.vpc_cidr.cidr_block

  tags = {
    Name      = "setup just for security group testing"
    Terraform = "true"
  }
}