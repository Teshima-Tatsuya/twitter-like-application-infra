resource "aws_s3_bucket" "front" {
  bucket_prefix = var.s3_bucket_name
  force_destroy = true
}
