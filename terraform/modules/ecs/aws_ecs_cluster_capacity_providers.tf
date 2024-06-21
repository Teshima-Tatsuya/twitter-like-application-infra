resource "aws_ecs_cluster_capacity_providers" "all" {
  cluster_name = aws_ecs_cluster.twitter.name

  capacity_providers = ["nginx"]
  # capacity_providers = keys(local.services)

  # dynamic "default_capacity_provider_strategy" {
  #   for_each = local.services
  #   content {
  #     capacity_provider = aws_ecs_capacity_provider.all[default_capacity_provider_strategy.key].name
  #   }
  # }
  default_capacity_provider_strategy {
    base = 1
    capacity_provider = "nginx"
  }
}