resource "aws_ecs_task_definition" "nginx" {
  family = "nginx"
  container_definitions = file("${path.module}/task-difinitions/nginx.json")
  network_mode = "bridge"
  requires_compatibilities = ["EC2"]
  task_role_arn = var.iam.role_ecsInstanceRole.arn
  runtime_platform {
    cpu_architecture = "ARM64"
  }
}