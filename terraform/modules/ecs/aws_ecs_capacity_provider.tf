resource "aws_ecs_capacity_provider" "main" {
  name = "main"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.main.arn
  }
}