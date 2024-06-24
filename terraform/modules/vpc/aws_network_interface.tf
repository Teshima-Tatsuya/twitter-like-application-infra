resource "aws_network_interface" "all" {
  for_each = local.services

  subnet_id = aws_subnet.all["subnet-${each.value.subnet}"].id
  security_groups = [aws_security_group.all["sgp-${each.key}"].id]

  source_dest_check = each.key == "nginx" ? false : true
}