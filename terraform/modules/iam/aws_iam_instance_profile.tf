resource "aws_iam_instance_profile" "nginx" {
    name = "nginx"
    role = aws_iam_role.nginx.name
}