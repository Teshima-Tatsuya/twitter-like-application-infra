resource "aws_launch_template" "main" {
  name        = "lt-main"
  description = "launch template for main"

  image_id      = jsondecode(data.aws_ssm_parameter.amzn2023_arm64_ami.value).image_id
  instance_type = "t4g.small"
  iam_instance_profile {
    name = var.iam.profile.name
  }

  update_default_version = true

  user_data = base64encode(file("${path.module}/userdata.sh"))

  network_interfaces {
    network_interface_id = var.vpc.eni.id
  }


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "twitter-like-application"
      ServerType = "Web"
    }
  }
}
