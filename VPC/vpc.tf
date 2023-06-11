terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#Retrieve the list of AZs in the current AWS region
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  profile = "terraform"
}
#Define the VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.vpc_name
    Environment = "cams_environment"
    Terraform   = "true"
  }
}
