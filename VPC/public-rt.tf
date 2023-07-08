#Create route tables for public and private subnets 
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
    #nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name      = "cams_public_rtb"
    Terraform = "true"
  }
}