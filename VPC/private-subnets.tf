#Deploy the private subnets
resource "aws_subnet" "private_subnets" {
    for_each           = var.private_subnets
    vpc_id             = aws_vpc.vpc.id
    cidr_block         = cidrsubnet(var.vpc_cidr, 8, each.value )
    availability_zone  = tolist(data.aws_availability_zones.available.names)[each.value]

    tags = {
        Name      = each.key
        Terraform = "true"
    }
}

resource "aws_route_table_association" "private" {
    depends_on     = [aws_subnet.private_subnets]
    route_table_id = aws_route_table.private_route_table.id
    for_each       = aws_subnet.private_subnets
    subnet_id      = each.value.id
}