## For ECS
resource "aws_iam_role" "ecsInstanceRole" {
  name               = "ecsInstanceRole"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy-ecs-tasks.json
}
resource "aws_iam_role" "ecsExecutionRole" {
  name               = "ecsExecutionRole"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy-ecs-tasks.json
}


resource "aws_iam_role" "nginx" {
  name               = "nginx"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

## For RDS
resource "aws_iam_role" "stop-rds" {
  name               = "stop-rds"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy-scheduler.json
}