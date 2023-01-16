resource "aws_instance" "nginx-webserver" {
    ami = "ami-06878d265978313ca"
    instance_type = "t2.micro"
    key_name = "nginx"
    subnet_id = aws_subnet.subnet_az1.id
    security_groups = [aws_security_group.nginx-lab.id]
    associate_public_ip_address = true
    user_data = file("~/iti/terraform/day1/userdata")
    tags = {
      Name = "nginx-webserver"
    }
#   user_data = <<-EOF
#         #!/bin/bash
#         sudo apt update -y
#         sudo apt install nginx 
#         sudo systemctl enable --now nginx
#     EOF
}