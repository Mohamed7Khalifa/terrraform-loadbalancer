resource "aws_instance" "private-ec2" {
    ami = var.ec2-metadata["image"]
    instance_type = var.ec2-metadata["type"]
    key_name = var.ec2-metadata["key_pair"]
    subnet_id = var.subnet-id
    security_groups = [aws_security_group.nginx-lab.id]
    tags = {
      Name = var.ec2-metadata["machine-name"]
    }
    user_data = <<-EOF
          #!/bin/bash
          sudo apt update -y
          sudo apt install nginx -y
          sudo systemctl enable --now nginx
      EOF
}

