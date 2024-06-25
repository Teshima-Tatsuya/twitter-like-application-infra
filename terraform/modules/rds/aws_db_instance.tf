resource "aws_db_instance" "main" {
  allocated_storage = 20
  instance_class = "db.t4g.micro"
  engine = "postgres"
  username = "postgres"
  password = "postgres"
  max_allocated_storage = 0 # disable autoscaling
  db_subnet_group_name = aws_db_subnet_group.main.name

  identifier = "postgresql-service"

  vpc_security_group_ids = [var.vpc.sg.sgp-rds.id]

}