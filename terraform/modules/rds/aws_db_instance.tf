resource "aws_db_instance" "main" {
  allocated_storage = 20
  instance_class = "db.t4g.micro"
  engine = "postgres"
  username = "postgres"
  password = "postgres"
  max_allocated_storage = 0 # disable autoscaling
  db_subnet_group_name = aws_db_subnet_group.main.name
  parameter_group_name = aws_db_parameter_group.default.name

  identifier = "postgresql-service"

  # delete config
  deletion_protection = false
  skip_final_snapshot = true

  vpc_security_group_ids = [var.vpc.sg.sgp-rds.id]

}