resource "aws_security_group" "my-new-security-group" {
    name        = "web_server_inbound"
    description = "Allow inbound traffic on tcp/443"
    vpc_id      = aws_vpc.vpc.id
    ingress {
        description = "Allow SSH"
        from_port   = 20
        to_port     = 20
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow 443 from the Internet"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow 3306 to RDS"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name    = "web_server_inbound"
        Purpose = "Intro to Resource Blocks Lab"
    }
}