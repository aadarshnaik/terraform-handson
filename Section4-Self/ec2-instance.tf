resource "aws_instance" "myec2" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.allow_connection.id ]
  tags = {
    "Name": "EC2-self-terraform"
  }
}