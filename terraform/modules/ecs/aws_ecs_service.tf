resource "aws_ecs_service" "all" {
  for_each = local.services
  name = each.value.service_name

  cluster = aws_ecs_cluster.twitter.arn
  task_definition = aws_ecs_task_definition.all[each.key].arn
  desired_count = 1

  capacity_provider_strategy {
    base = 1
    capacity_provider = "main"
    weight = 100
  }

  service_connect_configuration {
    enabled = true
    namespace = aws_service_discovery_http_namespace.main.arn
    service {
      port_name = each.value.port_name
      client_alias {
        dns_name = each.value.service_name
        port = each.value.port
      }
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