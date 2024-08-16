resource "aws_iam_role_policy_attachment" "ecsInstanceRole-AmazonEC2ContainerServiceforEC2Role" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.AmazonEC2ContainerServiceforEC2Role.arn
}

resource "aws_iam_role_policy_attachment" "ecsInstanceRole-AmazonSSMManagedInstanceCore" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_role_policy_attachment" "ecsExecutionRole-ssm" {
  role       = aws_iam_role.ecsExecutionRole.name
  policy_arn = aws_iam_policy.ecs-execution-ssm.arn
}

resource "aws_iam_role_policy_attachment" "ecsExecutionRole-AmazonEC2ContainerServiceforEC2Role" {
  role       = aws_iam_role.ecsExecutionRole.name
  policy_arn = data.aws_iam_policy.AmazonEC2ContainerServiceforEC2Role.arn
}

resource "aws_iam_role_policy_attachment" "ec2-" {
  role       = aws_iam_role.ec2.name
  policy_arn = aws_iam_policy.ec2.arn
}