// wow, cool.  Possible. available.  But not suggested nor convention.
/*
    For great blocking comments
    You can use the classic 'c' comments :-)
    see the terraform registry link for discovering the version number of providers
    https://registry.terraform.io/browse/providers
*/
# there are three types of comments, can you spot them here?
# is the comment convention for terraform
terraform {
  # terraform version
  required_version = ">= 1.0.0"
  required_providers {
    # AWS version (currently at 5.4.0)

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    http = {
      source  = "hashicorp/http"
      version = ">= 3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "terraform"
}