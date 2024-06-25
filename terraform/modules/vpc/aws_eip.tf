resource "aws_eip" "main" {
  domain = "vpc"
  network_interface = aws_network_interface.main.id

  depends_on = [ 
    aws_internet_gateway.main
  ]
}