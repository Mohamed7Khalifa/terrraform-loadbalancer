output "ec2_public_ip" {
    value = aws_instance.Public-ec2.public_ip
}
output "ec2_private_ip" {
    value = aws_instance.Private-ec2.private_ip
}