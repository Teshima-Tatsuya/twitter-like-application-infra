output "vpc" {
    value = {
        subnet = aws_subnet.all
        sg = aws_security_group.all
        vpc = aws_vpc.main
        eni = aws_network_interface.main
        eip = aws_eip.main
    }
}