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

## For ECS
### ECS Task
data "aws_iam_policy_document" "assume_role_policy-ecs-tasks" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ec2" {
  statement {
    actions = ["*"]
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "ecs-execution-ssm" {
  statement {
    actions = ["ssm:GetParameters"]
    resources = [
      "*"
    ]
  }
}

## For RDS
data "aws_iam_policy_document" "assume_role_policy-scheduler" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "stop-rds" {
  statement {
    actions = ["rds:StopDBInstance"]
    resources = [
      "*"
    ]
  }
}