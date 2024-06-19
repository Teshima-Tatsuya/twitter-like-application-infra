resource "aws_service_discovery_http_namespace" "nginx" {
  name = "nginx"
  description = "nginx"
}

resource "aws_service_discovery_http_namespace" "rails" {
  name = "rails"
  description = "rails"
}