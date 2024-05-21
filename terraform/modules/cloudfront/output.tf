output "cloudfront" {
  value = {
    distribution = {
        front = aws_cloudfront_distribution.front
    }
  }
}