resource "aws_ecs_capacity_provider" "all" {
  for_each = local.services

  name = each.key

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.main.arn
  }
}