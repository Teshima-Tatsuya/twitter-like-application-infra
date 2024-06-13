data "aws_ssm_parameter" "amzn2023_arm64_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2023/arm54/recommended"
}

data "aws_key_pair" "teshima-keypair" {
  key_name = "teshima-keypair"
}

data "aws_iam_role" "autoscaling" {
  name = "AWSServiceRoleForAutoScaling"
}