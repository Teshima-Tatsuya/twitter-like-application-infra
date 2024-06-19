resource "aws_network_interface" "all" {
  for_each = local.services

  subnet_id = aws_subnet.all["subnet-pub-a"].id
  security_groups = [aws_security_group.all["sgp-${each.key}"].id]
}