resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = aws_s3_bucket.front.arn
  policy = data.aws_iam_policy_document.allow_cloudfront.json
}
