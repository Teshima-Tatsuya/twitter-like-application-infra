resource "aws_ecs_service" "all" {
  for_each = local.services
  name = each.value.service_name

  cluster = aws_ecs_cluster.twitter.arn
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count = 1

  service_connect_configuration {
    enabled = true
    namespace = aws_service_discovery_http_namespace.all[each.key].arn
    service {
      port_name = each.value.port_name
      discovery_name = each.value.service_name
    }
  }

  # 以下は毎回差分が出るため設定
  lifecycle {
    ignore_changes = [ 
      health_check_grace_period_seconds,
      propagate_tags,
      tags,
      capacity_provider_strategy,
      deployment_circuit_breaker,
      deployment_controller,
    ]
  }

}