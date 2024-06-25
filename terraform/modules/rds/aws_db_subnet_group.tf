resource "aws_db_subnet_group" "main" {
  name = "main"
  subnet_ids = [var.vpc.subnet.subnet-pri-a.id, var.vpc.subnet.subnet-pri-c.id]
}