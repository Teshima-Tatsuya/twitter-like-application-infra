resource "aws_iam_policy" "nginx" {
  name = "nginx"
  policy = data.aws_iam_policy_document.nginx.json
}