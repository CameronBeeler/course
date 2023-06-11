# working with tf blocks
terraform {
    required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
  
provider "aws" {
    region = "us-west-2"
    profile = "terraform"
}

# Terraform Data Block - Lookup Ubuntu 20.04
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
resource "aws_instance" "cam-one" {
    ami = "data.aws_ami.ubuntu.id"
    instance_type = "t3.micro"

#   subnet_id = "<SUBNET>"
#   vpc_security_group_ids = ["<SECURITY_GROUP>"]

    tags = {
        "Identity" = "Cams_default_VPC_Ubuntu"
    }
}