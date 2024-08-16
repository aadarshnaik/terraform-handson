output "instance_ip" {
    description = "To get the public IP"
    value = aws_instance.myec2.public_ip
}

output "instance_dns" {
  description = "To get the instance DNS"
  value = aws_instance.myec2.public_dns
}