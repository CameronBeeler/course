terraform {
    required_version = ">= 1.0.0"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 3.0"
        }
        http = {
            source = "hashicorp/http"
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
            source = "hashicorp/tls"
            version = "~> 4.0.0"
        }
    } 
}

provider "aws" {
    region = "us-west-2"
    profile = "terraform"
}