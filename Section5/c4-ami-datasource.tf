data "aws_ami" "amzlinix2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_availability_zones" "my_azone" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
