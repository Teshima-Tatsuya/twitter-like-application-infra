resource "aws_ecs_service" "all" {
  for_each = local.services
  name = each.value.service_name

  cluster = aws_ecs_cluster.twitter.arn
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count = 1

  # 以下は毎回差分が出るため設定
  lifecycle {
    ignore_changes = [ 
      health_check_grace_period,
      propagate_tags,
      tags,
      capacity_provider_strategy,
      deployment_circult_breader,
      deployment_controller,
    ]
  }

}