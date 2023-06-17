output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc.id
}

output "cidr_block" {
    description = "the CIDR block used to configure the vpc"
    value = var.cidr_block
}
