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

resource "aws_instance" "cam-one" {
    ami = "<AMI>"
    instance_type = "t3.micro"

    subnet_id = "<SUBNET>"
    vpc_security_group_ids = ["<SECURITY_GROUP>"]

    tags = {
        "Identity" = "<IDENTITY>"
    }
}