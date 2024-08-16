resource "aws_subnet" "all" {
    for_each = var.vpc_subnet

    vpc_id = aws_vpc.x.id
    cidr_block = cidrsubnet(
        aws_vpc.x.cidr_block,
        each.value.cidr_block_host,
        each.value.cidr_block_bit
    )

    availability_zone = each.value.az

    tags = {
        Name = each.key
    }
}

