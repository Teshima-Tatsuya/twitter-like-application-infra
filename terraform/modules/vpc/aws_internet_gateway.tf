resource "aws_internet_gateway" "x" {
  vpc_id = aws_vpc.x.id

  tags = {
    Name = "x-igw"
  }
}
