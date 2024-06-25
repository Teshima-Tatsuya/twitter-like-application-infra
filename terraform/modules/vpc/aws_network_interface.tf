resource "aws_network_interface" "main" {
  subnet_id = aws_subnet.all["subnet-pub-a"].id
  security_groups = [aws_security_group.all["sgp-main"].id]
}