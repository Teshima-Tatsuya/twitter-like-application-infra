resource "aws_db_parameter_group" "default" {
  name = "postgres-pg"
  family = "postgres16"

  # avoid error regargind ssl
  parameter {
    name = "rds.force_ssl"
    value = 0
    apply_method = "immediate"
  }
}