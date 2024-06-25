resource "aws_db_instance" "main" {
  allocated_storage = 20
  instance_class = "t4g.micro"
  engine = "postgresql"
  manage_master_user_password = true
  username = "postgres"
  password = "postgres"
  max_allocated_storage = 0 # disable autoscaling

}