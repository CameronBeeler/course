output "vpc_id" {
  description = "the VPC ID"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

# output "subnets" {
#     description = "the subnet cidrs"
#     value = aws_subnet.private_subnets[each.key]
# }

output "private_subnet_cidrs" {
  description = "The private subnet CIDRs"
  value = {
    for subnet_key, subnet in aws_subnet.private_subnets : subnet_key => subnet.cidr_block
  }
}
output "public_subnet_cidrs" {
  description = "The public subnet CIDRs"
  value = {
    for subnet_key, subnet in aws_subnet.public_subnets : subnet_key => subnet.cidr_block
  }
}

output "ssh_key" {
  description = "the source of the new pem file"
  value       = local_file.private_key_pem.filename
}

output "ec2_ubuntu22" {
  description = "ubuntu22 Web Server"
  value       = aws_instance.locals_web_server.ami
}