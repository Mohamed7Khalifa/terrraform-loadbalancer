resource "aws_security_group" "nginx-lab" {
    name = "nginx-lab"
    description = "Allow inbound traffic"
    vpc_id = aws_vpc.iti-vpc.id

    ingress {
        from_port        = var.security_group-ports["ssh"]
        to_port          = var.security_group-ports["ssh"]
        protocol         = var.security_group-protocol["ingress"] 
        cidr_blocks      = [var.inbound-role-anywhere_ip]
    }

    ingress {
        from_port        = var.security_group-ports["http"]
        to_port          = var.security_group-ports["http"]
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