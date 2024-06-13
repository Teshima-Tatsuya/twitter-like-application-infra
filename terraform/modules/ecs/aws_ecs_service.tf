resource "aws_ecs_service" "nginx" {
  for_each = local.services
  name = each.value.service_name

  cluster = aws_ecs_cluster.twitter.arn
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count = 1
}