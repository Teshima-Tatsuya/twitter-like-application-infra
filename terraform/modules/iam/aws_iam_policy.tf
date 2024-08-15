## For ECS
resource "aws_iam_policy" "nginx" {
  name = "nginx"
  policy = data.aws_iam_policy_document.nginx.json
}

resource "aws_iam_policy" "ecs-execution-ssm" {
  name = "ecs-execution-ssm"
  policy = data.aws_iam_policy_document.ecs-execution-ssm.json
}

## For RDS
resource "aws_iam_policy" "stop-rds" {
  name = "stop-rds"
  policy = data.aws_iam_policy_document.stop-rds.json
}
