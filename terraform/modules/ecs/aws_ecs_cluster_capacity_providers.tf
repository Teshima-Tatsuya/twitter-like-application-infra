resource "aws_ecs_cluster_capacity_providers" "nginx" {
  cluster_name = aws_ecs_cluster.nginx.name

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "EC2"
  }
}