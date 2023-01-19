resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.iti-vpc.id
    route {
        cidr_block  = var.inbound-role-anywhere_ip
        gateway_id = aws_internet_gateway.iti-internet_gateway.id
    }
    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "subnet_az1-association" {
    subnet_id = aws_subnet.subnet_az1[0].id
    route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table" "nat-route_table" {
  vpc_id = aws_vpc.iti-vpc.id
  route {
    cidr_block = var.inbound-role-anywhere_ip
    nat_gateway_id = aws_nat_gateway.iti-nat_gateway.id
  }
}

resource "aws_route_table_association" "nat_gateway-association" {
  subnet_id = aws_subnet.subnet_az1[1].id
  route_table_id = aws_route_table.nat-route_table.id
}



