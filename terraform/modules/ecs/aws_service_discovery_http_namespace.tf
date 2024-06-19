resource "aws_service_discovery_http_namespace" "nginx" {
  for_each = local.services

  name = each.value.service_name
  description = each.key
}