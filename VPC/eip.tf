# Create an elastic IP for the NAT gateway
resource "aws_eip" "nat_gateway_eip" {
#   domain = "vpc"
    depends_on = [aws_internet_gateway.internet_gateway]
    tags = {
        Name = "cams_igw_eip"
    } 
}