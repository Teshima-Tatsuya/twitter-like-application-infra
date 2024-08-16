resource "aws_route_table" "all" {
    for_each = var.vpc_route

    vpc_id = aws_vpc.x.id

    tags = {
        Name = each.key
    }   
}