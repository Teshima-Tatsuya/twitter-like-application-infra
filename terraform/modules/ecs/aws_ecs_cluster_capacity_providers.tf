resource "aws_ecs_cluster_capacity_providers" "all" {
  cluster_name = aws_ecs_cluster.twitter.name

  capacity_providers = keys(local.services)

  dynamic "default_capacity_provider_strategy" {
    for_each = local.services
    content {
      base              = 1
      weight            = 100
      capacity_provider = aws_ecs_capacity_provider.all[default_capacity_provider_strategy.key].name
    }
  }
}