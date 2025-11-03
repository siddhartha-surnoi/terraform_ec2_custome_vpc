####################################################
# AWS Configuration
####################################################
variable "region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "ap-south-1"
}

####################################################
# Project Metadata
####################################################
variable "project_name" {
  description = "Project name prefix for all resources"
  type        = string
  default     = "fusioniq"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "developed_by" {
  description = "Developer or maintainer name"
  type        = string
  default     = "Siddhartha"
}

####################################################
# Networking Configuration
####################################################
variable "vpc_id" {
  description = "Custom VPC ID where EC2 and SGs will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "Public Subnet ID for EC2 instances"
  type        = string
}

variable "allowed_cidr" {
  description = "Allowed CIDR for inbound traffic"
  type        = string
  default     = "0.0.0.0/0"
}

####################################################
# IAM Role (Optional)
####################################################
variable "iam_instance_profile" {
  description = "IAM instance profile name or ARN to attach to EC2 instances (optional)"
  type        = string
  default     = ""
}

####################################################
# AMI Configuration
####################################################
variable "ami_owner_id" {
  description = "AWS Account ID that owns the AMI"
  type        = string
  default     = "361769585646"
}

variable "ami_name_pattern" {
  description = "AMI name pattern for lookup"
  type        = string
  default     = "surnoi-ubuntu-base-v*"
}

####################################################
# Security Group Configuration
####################################################
variable "security_groups" {
  description = "Security groups configuration"
  type = map(object({
    desc  = string
    ports = list(number)
  }))

  default = {
    aiml = {
      desc  = "Security group for AIML servers"
      ports = [22, 6379, 8000, 8001, 8002, 8003]
    }
  }
}

####################################################
# EC2 Configuration
####################################################
variable "instance_configs" {
  description = "Configuration for EC2 instances"
  type = map(object({
    instance_type  = string
    volume_size    = number
    user_data_path = string
    security_group = string
  }))

  default = {
    AIML = {
      instance_type  = "g4dn.xlarge"
      volume_size    = 30
      user_data_path = "script/aiml_script.sh"
      security_group = "aiml"
    }
  }
}
