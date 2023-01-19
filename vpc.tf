resource "aws_vpc" "iti-vpc" {
    cidr_block = var.iti-vpc-cidr
    tags = {
        "Name" = "iti-vpc"
    }
    }