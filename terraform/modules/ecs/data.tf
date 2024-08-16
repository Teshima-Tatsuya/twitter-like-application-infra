data "aws_ssm_parameter" "amzn2023_arm64_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2023/arm64/recommended"
}

data "aws_iam_role" "autoscaling" {
  name = "AWSServiceRoleForAutoScaling"
}