resource "aws_instance" "ec2" {
  for_each = var.instance_conf

  ami                    = var.ami_id
  instance_type          = each.value.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [lookup(var.sg_ids, each.value.security_group, null)]

  # Optional IAM Role
  iam_instance_profile = var.iam_instance_profile != "" ? var.iam_instance_profile : null

  root_block_device {
    volume_size = each.value.volume_size
  }

  user_data = each.value.user_data_path != "" ? file(each.value.user_data_path) : null

  tags = merge(var.tags, {
    Name = "${var.project_name}-${each.key}-instance"
  })
}