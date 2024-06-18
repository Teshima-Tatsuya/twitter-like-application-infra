resource "aws_network_interface" "nginx" {
  subnet_id = aws_subnet.all["subnet-pub-a"].id
  security_groups = [aws_security_group.all["sgp-nginx"].id]
}

resource "aws_network_interface" "rails" {
  subnet_id = aws_subnet.all["subnet-pri-a"].id
  security_groups = [aws_security_group.all["sgp-rails"].id]
}