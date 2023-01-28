output "ec2_private_ip-az1" {
    value = aws_instance.private-ec2-az1.private_ip
}
output "ec2_private_ip-az2" {
    value = aws_instance.private-ec2-az2.private_ip
}