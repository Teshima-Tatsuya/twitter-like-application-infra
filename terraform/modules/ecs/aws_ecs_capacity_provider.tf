resource "aws_ecs_capacity_provider" "nginx" {
  name = "nginx"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.nginx.arn
    managed_termination_protection = "ENABLED"
  }
}