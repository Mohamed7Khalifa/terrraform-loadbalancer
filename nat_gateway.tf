resource "aws_nat_gateway" "iti-nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_az1[0].id
}

resource "aws_eip" "nat_eip" {
  vpc = true
}