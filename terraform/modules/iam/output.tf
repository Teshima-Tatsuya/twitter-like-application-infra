output "iam" {
  value = {
    "role" = aws_iam_role.nginx
    "role_ecsInstanceRole" = aws_iam_role.ecsInstanceRole
    "profile" = aws_iam_instance_profile.nginx
  }
}