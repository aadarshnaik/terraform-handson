output "instance_public_ip" {
  description = "ec2 instance public ip"
  value = aws_instance.myec2vm.public_ip
}

output "instance_public_dns" {
  description = "ec2 instance public DNS"
  value = aws_instance.myec2vm.public_dns
}