resource "aws_s3_account_public_access_block" "front" {
  block_public_acls   = false
  block_public_policy = false
}
