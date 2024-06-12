resource "aws_iam_role" "nginx" {
  name               = "nginx"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}