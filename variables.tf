variable "ec2-metadata" {
  type        = map(string)
  description = "The id of the machine image (AMI) to use for the server."
}
variable "region-US-East" {
  type        = string
  description = "this is the aws provider region-US-East"
}
variable "iti-vpc-cidr" {
  type        = string
  description = "this is the cidr of vpc"
}
variable "iti-subnets-cidr_az1" {
  type        = list
  description = "those are subnets cidr "
}
variable "iti-subnets-cidr_az2" {
  type        = list
  description = "those are subnets cidr "
}
variable "inbound-role-anywhere_ip" {
  type        = string
  description = "this inbound role for any ip"
}

variable "availability_zone_east-1a" {
  type        = string
  description = "availability_zone us-east-1a"
}
variable "availability_zone_east-1b" {
  type        = string
  description = "availability_zone us-east-1b"
}
variable "security_group-ports"{
  type        = map
  description = "the ports of security group"
}
variable "security_group-protocol"{
  type        = map(string)
  description = "the protocols of security group"
}
variable "bucket" {
  type = string
}