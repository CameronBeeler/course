# great place for locals variables block
# Sec4, Chapter 15

locals {
    team = "api_mgmt_dev"
    application = "corp_api"
    server_name = "ec2-${var.environment}-api-${var.variables_sub_az}"
}
