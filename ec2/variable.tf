variable "ami_id" {}
variable "subnet_id" {}
variable "instance_conf" {}
variable "sg_ids" {}
variable "tags" {}
variable "project_name" {}

# Optional IAM Role
variable "iam_instance_profile" {
  description = "IAM instance profile name or ARN (optional)"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "Key pair name for EC2 instance login"
  type        = string
}
