# VPC resource creation

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "Cams-SQ-VPC-Lab"
        Lab = "ThirdLab"
    }
}