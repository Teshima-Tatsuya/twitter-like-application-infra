resource "aws_cloudfront_distribution" "front" {
  aliases = [var.cloudfront.domain_name]

  origin {
    domain_name = var.s3.bucket.front.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.front.id
    origin_id = "front"
  }

  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "front"

    forwarded_values {
      query_string = false
      headers = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["JP"]
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.cloudfront.certificate_global_arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
}

resource "aws_cloudfront_distribution" "backend" {
  aliases = [var.cloudfront.backend_domain_name]

  origin {
    domain_name = var.vpc.eip_nginx.public_dns
    origin_id = "backend"
    custom_origin_config {
      http_port = "80"
      https_port = "80"
      origin_protocol_policy = "http"
      origin_ssl_protocols = ["SSLv3"]
    }
  }

  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "front"

    forwarded_values {
      query_string = false
      headers = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["JP"]
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.cloudfront.certificate_global_arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
}