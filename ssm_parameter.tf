####################################################
# Networking Configuration (via SSM Parameters)
####################################################

# Fetch VPC ID from SSM Parameter Store
data "aws_ssm_parameter" "vpc_id" {
  name = "/logistics-mot/dev/vpc_id"
}

# Fetch public subnets (comma-separated list) from SSM Parameter Store
data "aws_ssm_parameter" "public_subnets" {
  name = "/logistics-mot/dev/public_subnets"
}

# Parse the first subnet from the list
locals {
  vpc_id           = data.aws_ssm_parameter.vpc_id.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnets.value)[0]
}
