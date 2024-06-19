resource "aws_service_discovery_http_namespace" "all" {
  for_each = local.services

  name = each.value.service_name
  description = each.key
}