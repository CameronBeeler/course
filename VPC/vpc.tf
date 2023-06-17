#Define the VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.vpc_name
    Environment = "cams_environment"
    Terraform   = "true"
    DataTestBlock = data.aws_region.current.name
  }
}