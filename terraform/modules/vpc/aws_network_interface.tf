resource "aws_network_interface" "ec2" {
  subnet_id = aws_subnet.all["subnet-pub-a"].id
  security_groups = [aws_security_group.all["sgp-ec2"].id]
}