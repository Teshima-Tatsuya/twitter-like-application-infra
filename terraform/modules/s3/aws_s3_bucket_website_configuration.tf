resource "aws_s3_bucket_website_configuration" "front" {
  bucket = aws_s3_bucket.front.id
  index_document {
    suffix = "index.html"
  }
}