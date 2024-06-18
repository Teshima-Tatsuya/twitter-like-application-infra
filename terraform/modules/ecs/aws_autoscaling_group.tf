resource "aws_autoscaling_group" "nginx" {
  name                      = "nginx"
  max_size                  = 1
  min_size                  = 0
  health_check_grace_period = 180
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = true

  availability_zones = ["ap-northeast-1a"]
  launch_template {
    id      = aws_launch_template.nginx.id
    version = "$Latest"
  }

  tag {
    key = "AmazonECSManaged"
    propagate_at_launch = true
    value = ""
  }

  lifecycle {
    ignore_changes = [ 
      desired_capacity,
    ]
  }
}

resource "aws_autoscaling_group" "rails" {
  name                      = "rails"
  max_size                  = 1
  min_size                  = 0
  health_check_grace_period = 180
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = true

  availability_zones = ["ap-northeast-1a"]
  launch_template {
    id      = aws_launch_template.rails.id
    version = "$Latest"
  }

  tag {
    key = "AmazonECSManaged"
    propagate_at_launch = true
    value = ""
  }

  lifecycle {
    ignore_changes = [ 
      desired_capacity,
    ]
  }
}