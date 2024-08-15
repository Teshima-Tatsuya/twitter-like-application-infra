output "iam" {
  value = {
    "role" = {
      "nginx" = aws_iam_role.nginx,
      "ecsInstanceRole" = aws_iam_role.ecsInstanceRole,
      "ecsExecutionRole" = aws_iam_role.ecsExecutionRole,
    }
    "profile" = aws_iam_instance_profile.nginx
  }
}