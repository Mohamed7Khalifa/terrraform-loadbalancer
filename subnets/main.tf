#---------------------------"subnets in az1"----------------------------

resource "aws_subnet" "subnets_az1" {
    vpc_id = aws_vpc.iti-vpc.id
    count = length(var.iti-subnets-cidr_az1)
    availability_zone = var.availability_zone_east-1a
    cidr_block = var.iti-subnets-cidr_az1[count.index]
    tags = {
        Name = "subnets-az1"
    }
}
#---------------------------"subnets in az2"----------------------------
resource "aws_subnet" "subnets_az2" {
    vpc_id = aws_vpc.iti-vpc.id
    count = length(var.iti-subnets-cidr_az2)
    availability_zone = var.availability_zone_east-1b
    cidr_block = var.iti-subnets-cidr_az2[count.index]
    tags = {
        Name = "subnets-az2"
    }
}