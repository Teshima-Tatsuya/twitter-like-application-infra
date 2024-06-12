resource "aws_launch_template" "nginx" {
  name        = "lt-nginx"
  description = "launch template for nginx"

  image_id      = data.aws_ssm_parameter.amzn2023_arm64_ami.value
  instance_type = "t4g.small"
  iam_instance_profile {
    name = var.iam.profile.name
  }
  vpc_security_group_ids = [var.vpc.sg.sgp-nginx.id]

  update_default_version = true

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "nginx"
      ServerType = "Web"
    }
  }
}