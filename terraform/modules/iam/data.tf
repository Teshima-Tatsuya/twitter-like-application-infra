data "aws_iam_policy" "AmazonEC2ContainerServiceforEC2Role" {
  name = "AmazonEC2ContainerServiceforEC2Role"
}

data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  name = "AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "nginx" {
  statement {
    actions = ["*"]
    resources = [
      "*"
    ]
  }
}