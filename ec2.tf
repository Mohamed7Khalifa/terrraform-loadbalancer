resource "aws_instance" "Public-ec2" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = aws_subnet.subnet_az1[0].id
    security_groups = [aws_security_group.nginx-lab.id]
    associate_public_ip_address = true
    # user_data = file("~/iti/terraform/day1/iti-terraform/userdata")
    tags = {
      Name = "Public-ec2"
    }
    user_data = <<-EOF
          #!/bin/bash
          sudo apt update -y
          sudo apt install nginx -y
          sudo systemctl enable --now nginx
      EOF
}
resource "aws_instance" "Private-ec2" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = aws_subnet.subnet_az1[1].id
    security_groups = [aws_security_group.nginx-lab.id]
    # associate_public_ip_address = true
    # user_data = file("~/iti/terraform/day1/iti-terraform/userdata")
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