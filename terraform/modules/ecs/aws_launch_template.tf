resource "aws_launch_template" "all" {
  for_each = local.services

  name        = "lt-${each.key}"
  description = "launch template for ${each.key}"

  image_id      = jsondecode(data.aws_ssm_parameter.amzn2023_arm64_ami.value).image_id
  instance_type = "t4g.small"
  iam_instance_profile {
    name = var.iam.profile.name
  }

  key_name = data.aws_key_pair.teshima-keypair.key_name

  update_default_version = true

  user_data = base64encode(file("${path.module}/userdata_${each.key}.sh"))

  network_interfaces {
    network_interface_id = var.vpc.eni[each.key].id
  }


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = each.key
      ServerType = "Web"
    }
  }
}
