resource "aws_iam_role_policy_attachment" "ecsInstanceRole-AmazonEC2ContainerServiceforEC2Role" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.AmazonEC2ContainerServiceforEC2Role.arn
}

resource "aws_iam_role_policy_attachment" "nginx" {
  role       = aws_iam_role.nginx.name
  policy_arn = aws_iam_policy.nginx.arn
}