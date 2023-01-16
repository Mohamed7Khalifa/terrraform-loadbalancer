resource "aws_internet_gateway" "iti-internet_gateway" {
    vpc_id = aws_vpc.iti-vpc.id
    tags = {
        Name = "iti-internet_gateway"
    }
}

