variable "aws_region" {
  description = "Region in which aws resources will be created"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
    description = "EC2 Instance type"
    type = string
    default = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 key-pair that needs to be associated with isnatnce"
  type = string
  default = "terraform-ssh-kp"
}