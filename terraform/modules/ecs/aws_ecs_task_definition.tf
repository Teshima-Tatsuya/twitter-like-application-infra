resource "aws_ecs_task_definition" "all" {
  for_each = local.services
  family = each.key
  container_definitions = templatefile("${path.module}/task-difinitions/${each.key}.json", {
    name = each.key,
  })
  network_mode = "bridge"
  requires_compatibilities = ["EC2"]
  task_role_arn = var.iam.role.ecsInstanceRole.arn
  execution_role_arn = var.iam.role.ecsExecutionRole.arn


  runtime_platform {
    cpu_architecture = "ARM64"
  }
}