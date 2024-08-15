## For ECS
resource "aws_iam_policy" "nginx" {
  name = "nginx"
  policy = data.aws_iam_policy_document.nginx.json
}

resource "aws_iam_policy" "ecs-execution-ssm" {
  name = "ecs-execution-ssm"
  policy = data.aws_iam_policy_document.ecs-execution-ssm.json
}