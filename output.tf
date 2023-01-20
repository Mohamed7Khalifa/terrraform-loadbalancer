output "ec2_public_ip" {
    value = aws_instance.Public-ec2.public_ip
}