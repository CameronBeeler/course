
#Define the VPC
module "first_vpc_module" {
  source     = "./modules/vpc_module"
  vpc_name = "cam_rename_vpc"
  Environment = "dev"
}


module "subnet_addrs" {
 source  = "hashicorp/subnets/cidr"
        version = "1.0.0"
        base_cidr_block = module.first_vpc_module.cidr_block
        # base_cidr_block = cidrsubnet(var.vpc_cidr, 8, each.value)
        networks = [
        {
            name     = "module_network_a"
            new_bits = 4
        },
        {
            name     = "module_network_b"
            new_bits = 4
        },
    ] 
}

resource "aws_subnet" "subnet_a" {
    vpc_id             = module.first_vpc_module.vpc_id
    cidr_block         = module.subnet_addrs.networks[0].cidr_block
}

resource "aws_subnet" "subnet_b" {
    vpc_id             = module.first_vpc_module.vpc_id
    cidr_block         = module.subnet_addrs.networks[1].cidr_block
}