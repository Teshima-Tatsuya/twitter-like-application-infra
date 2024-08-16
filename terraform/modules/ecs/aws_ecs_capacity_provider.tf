resource "aws_ecs_capacity_provider" "x" {
  name = "x"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.x.arn
  }
}