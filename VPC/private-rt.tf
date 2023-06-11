# create a private route table and associate the private subnets, and add a nat route.
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block     = "0.0.0.0/0"
        # gateway_id     = aws_internet_gateway.internet_gateway.id
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }

    tags = {
        Name      = "cams_private_rtb"
        Terraform = "true"
    }
}