output "iam" {
  value = {
    "role" = aws_iam_role.nginx
    "profile" = aws_iam_instance_profile.nginx
  }
}