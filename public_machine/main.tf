resource "aws_instance" "public-ec2-az1" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = aws_subnet.subnets_az1[0].id
    security_groups = [aws_security_group.nginx-lab.id]
    associate_public_ip_address = true
    provisioner "remote-exec" {
      inline = var.provisioner-reverse-proxy
    }
    
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

resource "aws_instance" "public-ec2-az2" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = aws_subnet.subnets_az2[0].id
    security_groups = [aws_security_group.nginx-lab.id]
    associate_public_ip_address = true
    provisioner "remote-exec" {
      inline = var.provisioner-reverse-proxy
    }
    
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