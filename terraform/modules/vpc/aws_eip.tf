resource "aws_eip" "ec2" {
  domain = "vpc"
  network_interface = aws_network_interface.ec2.id

  depends_on = [ 
    aws_internet_gateway.x
  ]
}