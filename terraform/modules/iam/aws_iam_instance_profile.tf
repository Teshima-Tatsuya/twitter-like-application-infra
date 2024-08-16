resource "aws_iam_instance_profile" "ec2" {
    name = "ec2"
    role = aws_iam_role.ec2.name
}