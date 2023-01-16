resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.iti-vpc.id
    route {
        cidr_block  = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.iti-internet_gateway.id
    }
    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "subnet_az1-association" {
    subnet_id = aws_subnet.subnet_az1.id
    route_table_id = aws_route_table.public-route-table.id
}

