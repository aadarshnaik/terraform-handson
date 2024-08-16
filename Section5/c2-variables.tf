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

#Section 5 diff

variable "ec2_instance_type_list" {
    description = "EC2 Instance Type list"
    type = list(string)
    default = [ "t3.micro", "t3.small" ]
}

variable "ec2_instance_type_map" {
  description = "EC2 Instance typr map"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.medium"
  }
  
}

#Section 5 diff