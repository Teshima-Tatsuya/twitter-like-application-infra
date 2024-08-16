resource "aws_ecr_repository" "all" {
  for_each = local.services
  name = each.key

  force_delete = true
}