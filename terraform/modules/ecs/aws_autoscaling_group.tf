resource "aws_autoscaling_group" "nginx" {
  name                      = "nginx"
  max_size                  = 1
  min_size                  = 0
  health_check_grace_period = 180
  health_check_type         = "EC2"
  desired_capacity          = 0
  force_delete              = true

  vpc_zone_identifier = [var.vpc.subnet.subnet-pub-a.id, var.vpc.subnet.subnet-pub-c.id]

  launch_template {
    id      = aws_launch_template.nginx.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [ 
      desired_capacity,
    ]
  }
}