resource "aws_cloudfront_origin_access_control" "front" {
  name = "x-like-application-front"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}