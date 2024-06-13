resource "aws_route53_record" "front" {
  name = var.domain_name
  type = "A"
  zone_id = var.route53.zone_id

  alias {
    evaluate_target_health = false
    name = var.cloudfront.distribution.front.domain_name
    zone_id = var.cloudfront.distribution.front.hosted_zone_id
  }
}

resource "aws_route53_record" "backend" {
  name = var.domain_name
  type = "A"
  zone_id = var.route53.zone_id

  alias {
    evaluate_target_health = false
    name = var.cloudfront.distribution.backend.domain_name
    zone_id = var.cloudfront.distribution.backend.hosted_zone_id
  }
}