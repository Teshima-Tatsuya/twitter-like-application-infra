resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.twitter.name

  capacity_providers = ["main"]

  default_capacity_provider_strategy {
    weight = 1
    capacity_provider = aws_ecs_capacity_provider.main.name
  }
}