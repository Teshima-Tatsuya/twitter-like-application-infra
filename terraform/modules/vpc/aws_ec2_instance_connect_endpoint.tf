resource "aws_ec2_instance_connect_endpoint" "eic" {
    subnet_id = aws_subnet.all["subnet-pub-a"].id
    security_group_ids = [aws_security_group.all["sgp-eice"].id]
}