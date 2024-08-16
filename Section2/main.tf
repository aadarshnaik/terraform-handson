resource "aws_instance" "ec2demo" {
  ami           = "ami-0ae8f15ae66fe8cda" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}