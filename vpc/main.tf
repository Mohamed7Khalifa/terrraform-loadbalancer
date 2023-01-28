#---------------------------"vpc"----------------------------
resource "aws_vpc" "iti-vpc" {
    cidr_block = var.iti-vpc-cidr
    tags = {
        "Name" = "iti-vpc"
    }
    }
#---------------------------"internet gateway"----------------------------
resource "aws_internet_gateway" "iti-internet_gateway" {
    vpc_id = aws_vpc.iti-vpc.id
    tags = {
        Name = "iti-internet_gateway"
    }
}
#---------------------------"natgateway"----------------------------
resource "aws_nat_gateway" "iti-nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets_az1[0].id
}

resource "aws_eip" "nat_eip" {
  vpc = true
}
#---------------------------"route table"----------------------------
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

resource "aws_route_table" "nat-route_table" {
  vpc_id = aws_vpc.iti-vpc.id
  route {
    cidr_block = var.inbound-role-anywhere_ip
    nat_gateway_id = aws_nat_gateway.iti-nat_gateway.id
  }
}
# --------------------------------------"aws_route_table-nat_gateway-association"-----------------------------
resource "aws_route_table_association" "subnet_az1-association" {
    subnet_id = aws_subnet.subnets_az1[0].id
    route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "subnet_az2-association" {
    subnet_id = aws_subnet.subnets_az2[0].id
    route_table_id = aws_route_table.public-route-table.id
}


# --------------------------------------"aws_route_table-nat_gateway-association"-----------------------------
resource "aws_route_table_association" "nat_gateway-association" {
  subnet_id = aws_subnet.subnets_az1[1].id
  route_table_id = aws_route_table.nat-route_table.id
}
resource "aws_route_table_association" "nat_gateway-association" {
  subnet_id = aws_subnet.subnets_az2[1].id
  route_table_id = aws_route_table.nat-route_table.id
}


