resource "aws_service_discovery_http_namespace" "nginx" {
  name = "nginx-service"
  description = "nginx"
}

resource "aws_service_discovery_http_namespace" "rails" {
  name = "rails-service"
  description = "rails"
}