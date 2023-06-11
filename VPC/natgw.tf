# create a nat gateway
resource "aws_nat_gateway" "nat_gateway" {
    depends_on    = [aws_subnet.public_subnets]
    allocation_id = aws_eip.nat_gateway_eip.id
    subnet_id     = aws_subnet.public_subnets["public_subnet_1"].id
    tags = {
        Name = "cams_nat_gateway"
    } 
}