output "iam" {
  value = {
    "role" = {
      "ecsInstanceRole" = aws_iam_role.ecsInstanceRole,
      "ecsExecutionRole" = aws_iam_role.ecsExecutionRole,
    }
    "profile" = aws_iam_instance_profile.ec2
  }
}