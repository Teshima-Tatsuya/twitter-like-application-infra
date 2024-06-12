resource "aws_iam_role_policy_attachment" "nginx" {
  role       = aws_iam_role.nginx.name
  policy_arn = aws_iam_policy.nginx.arn
}