output "s3" {
  value = {
    bucket = {
        front = aws_s3_bucket.front
    }
  }
}