resource "aws_ecs_cluster_capacity_providers" "all" {
  for_each = local.services

  cluster_name = aws_ecs_cluster.twitter.name

  capacity_providers = [aws_ecs_capacity_provider.all[each.key].name]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = aws_ecs_capacity_provider.all[each.key].name
  }
}