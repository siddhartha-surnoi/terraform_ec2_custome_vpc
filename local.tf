####################################################
# Common Tags
####################################################
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    DevelopedBy = var.developed_by
  }
}
