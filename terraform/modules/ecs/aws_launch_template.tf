resource "aws_launch_template" "nginx" {
  name        = "lt-nginx"
  description = "launch template for nginx"

  image_id      = jsondecode(data.aws_ssm_parameter.amzn2023_arm64_ami.value).image_id
  instance_type = "t4g.small"
  iam_instance_profile {
    name = var.iam.profile.name
  }
  update_default_version = true

  user_data = base64encode(file("${path.module}/userdata.sh"))

  network_interfaces {
    delete_on_termination = true
    network_interface_id = var.vpc.eni_nginx.id
  }


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "nginx"
      ServerType = "Web"
    }
  }
}