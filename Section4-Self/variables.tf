variable "aws_region" {
  description = "To set default aws region"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
    description = "Defining Instance type"
    type = string
    default = "t2.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 key-pair that needs to be associated with isnatnce"
  type = string
  default = "terraform-ssh-kp"
}