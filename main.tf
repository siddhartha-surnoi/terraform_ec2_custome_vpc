# ####################################################
# # Security Group Module
# ####################################################
# module "security_groups" {
#   source        = "./sg"
#   vpc_id        = data.aws_vpc.custom.id
#   allowed_cidr  = var.allowed_cidr
#   sg_config     = var.security_groups
#   project_name  = var.project_name
#   tags          = local.common_tags
# }

# ####################################################
# # EC2 Module
# ####################################################
# module "ec2_instances" {
#   source               = "./ec2"
#   ami_id               = data.aws_ami.devops_team_ami.id
#   instance_conf        = var.instance_configs
#   sg_ids               = module.security_groups.sg_ids
#   subnet_id            = data.aws_subnet.public_subnet.id
#   project_name         = var.project_name
#   iam_instance_profile = var.iam_instance_profile
#   tags                 = local.common_tags
# }

####################################################
# Security Group Module
####################################################
module "security_groups" {
  source        = "./sg"
  vpc_id        = local.vpc_id
  allowed_cidr  = var.allowed_cidr
  sg_config     = var.security_groups
  project_name  = var.project_name
  tags          = local.common_tags
}

####################################################
# EC2 Module
####################################################
module "ec2_instances" {
  source               = "./ec2"
  ami_id               = data.aws_ami.devops_team_ami.id
  instance_conf        = var.instance_configs
  sg_ids               = module.security_groups.sg_ids
  subnet_id            = local.public_subnet_id
  project_name         = var.project_name
  iam_instance_profile = var.iam_instance_profile
  key_name           = var.key_name
  tags                 = local.common_tags
}
