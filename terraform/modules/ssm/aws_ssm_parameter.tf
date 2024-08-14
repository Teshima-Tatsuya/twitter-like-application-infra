locals {
  parametes = {
    "DB_HOST" = var.DB_HOST
    "DB_USERNAME" = var.DB_USERNAME
    "DB_PASSWORD" = var.DB_PASSWORD
    "SECRET_KEY_BASE" = var.SECRET_KEY_BASE
  }
}

resource "aws_ssm_parameter" "name" {
    for_each = local.parametes

    type = "String"
    name = "/ecs/x/${each.key}"
    value = each.value
}