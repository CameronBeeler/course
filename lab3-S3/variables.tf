# The backing variables file
variable "aws_region" {
    type = string
    description = "region used to deploy workloads" 
    default     = "us-west-2"
    validation {
        condition     = can(regex("^us-", var.aws_region))
        error_message = "The aws_region value must be a valid region in the USA, starting with \"us-\"."
    }
}