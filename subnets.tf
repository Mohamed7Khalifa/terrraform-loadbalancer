resource "aws_subnet" "subnet_az1" {
    vpc_id = aws_vpc.iti-vpc.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "subnet us-east-1a"
    }
}



