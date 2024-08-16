resource "aws_vpc" "x" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
        Name = "x-vpc"
    }
}