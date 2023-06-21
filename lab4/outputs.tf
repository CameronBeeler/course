output "hello-world" {
    description = "Print a Hello World text output"
    value = "I really want to say - ${module.first_vpc_module.hello-world}"
}

output "VPC_ID" {
    description = "the CIDR block used to configure the vpc"
    value = module.first_vpc_module.vpc_id
}

output "vpc_cidr" {
    description = "the VPC CIDR block"
    value = module.first_vpc_module.cidr_block 
}

output "cidr_block" {
    description = "the CIDR blocks of the subnets"
    value = module.subnet_addrs.network_cidr_blocks
}

output "ssh_key" {
    description = "the source of the new pem file"
    value = local_file.private_key_pem.filename
}