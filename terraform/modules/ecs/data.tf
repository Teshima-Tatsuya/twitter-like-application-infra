data "aws_ssm_parameter" "amzn2023_arm64_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-arm64"
}

data "aws_key_pair" "teshima-keypair" {
  key_name = "teshima-keypair"
}

data "aws_iam_role" "autoscaling" {
  name = "AWSServiceRoleForAutoScaling"
}