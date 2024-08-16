resource "aws_ecs_cluster_capacity_providers" "x" {
  cluster_name = aws_ecs_cluster.x.name

  capacity_providers = ["x"]

  default_capacity_provider_strategy {
    weight = 1
    capacity_provider = aws_ecs_capacity_provider.x.name
  }
}