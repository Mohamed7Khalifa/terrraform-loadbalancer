resource "aws_instance" "private-ec2-az1" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = aws_subnet.subnets_az1[1].id
    security_groups = [aws_security_group.private-ec2.id]
    tags = {
      Name = "Private-ec2"
    }
    user_data = <<-EOF
          #!/bin/bash
          sudo apt update -y
          sudo apt install nginx -y
          sudo systemctl enable --now nginx
      EOF
}
resource "aws_instance" "private-ec2-az2" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = aws_subnet.subnets_az2[1].id
    security_groups = [aws_security_group.private-ec2.id]
    tags = {
      Name = "Private-ec2"
    }
    user_data = <<-EOF
          #!/bin/bash
          sudo apt update -y
          sudo apt install nginx -y
          sudo systemctl enable --now nginx
      EOF
}
#--------------------------------------"private security group"------------------------------------------------
resource "aws_security_group" "private-ec2" {
    name = "private_security_group"
    description = "inbound traffic"
    vpc_id = aws_vpc.iti-vpc.id

    ingress {
        from_port        = var.security_group-ports["ssh"]
        to_port          = var.security_group-ports["ssh"]
        protocol         = var.security_group-protocol["ingress"] 
        cidr_blocks      = [var.inbound-role-anywhere_ip]
    }
    egress {
        from_port        = var.security_group-ports["egress"]
        to_port          = var.security_group-ports["egress"]
        protocol         = var.security_group-protocol["egress"]
        cidr_blocks      = [var.inbound-role-anywhere_ip]
    }
}