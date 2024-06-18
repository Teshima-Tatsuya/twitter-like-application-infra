output "vpc" {
    value = {
        subnet = aws_subnet.all
        sg = aws_security_group.all
        vpc = aws_vpc.main
        eni_nginx = aws_network_interface.nginx
        eni_rails = aws_network_interface.rails
        eip_nginx = aws_eip.nginx
    }
}