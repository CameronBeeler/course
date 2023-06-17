variable "cidr_block" {
    type = string
    default = "10.0.0.0/20" 
}

variable "vpc_name" { 
    type = string 
    default = "cams_vpc"
}

variable "Environment" {
    type = string
    default = "testing"
}

variable "Terraform" {
    type = string
    default = "true"
}

variable "moduleName" {
    type = string
    default = "main.tf"
}