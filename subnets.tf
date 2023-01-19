resource "aws_subnet" "subnet_az1" {
    vpc_id = aws_vpc.iti-vpc.id
    count = length(var.iti-subnets-cidr)
    availability_zone = var.availability_zone
    cidr_block = var.iti-subnets-cidr[count.index]
    tags = {
        Name = "subnet us-east-1a"
    }
}



