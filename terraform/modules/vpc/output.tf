output "vpc" {
    value = {
        subnet = aws_subnet.all
        sg = aws_security_group.all
        vpc = aws_vpc.x
        eni = aws_network_interface.ec2
        eip = aws_eip.ec2
    }
}