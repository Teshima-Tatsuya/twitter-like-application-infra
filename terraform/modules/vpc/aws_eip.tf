resource "aws_eip" "nginx" {
  domain = "vpc"
  network_interface = aws_network_interface.all["nginx"].id

  depends_on = [ 
    aws_internet_gateway.main
  ]
}