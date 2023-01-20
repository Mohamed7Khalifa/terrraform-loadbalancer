ec2-metadata = {
  "image" = "ami-06878d265978313ca"
  "type" = "t2.micro"
  "key_pair" = "nginx"
}

provider-aws-region = "us-east-1"

iti-vpc-cidr = "10.0.0.0/16"

iti-subnets-cidr = ["10.0.0.0/24","10.0.1.0/24"]

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