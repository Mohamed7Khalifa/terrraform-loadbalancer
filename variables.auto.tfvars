ec2-metadata = {
  "image" = "ami-06878d265978313ca"
  "type" = "t2.micro"
  "key_pair" = "nginx"
}
bucket = "backend10bucket"

region-US-East="us-east-1"

iti-vpc-cidr = "10.0.0.0/16"

iti-subnets-cidr_az1 = ["10.0.0.0/24","10.0.1.0/24"]
iti-subnets-cidr_az2 = ["10.0.2.0/24","10.0.3.0/24"]


inbound-role-anywhere_ip = "0.0.0.0/0"

availability_zone = "us-east-1a"

security_group-ports = {
        ssh = 22
        http = 80
        egress = 0
    }

security_group-protocol = {
        "ingress" = "tcp"
        "egress" = "-1"
    }
  