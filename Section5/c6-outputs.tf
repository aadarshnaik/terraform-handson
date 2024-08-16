# # This works if we use count. not for_each
# output "instance_public_ip" {
#   description = "ec2 instance public ip"
#   value = aws_instance.myec2vm[*].public_ip
#   # value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
# }

# output "instance_public_dns" {
#   description = "ec2 instance public DNS"
#   value = aws_instance.myec2vm[*].public_dns
#   # value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
# }
# # This works if we use count. not for_each

output "for_output_list" {
  description = "For loop with list"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

output "for_output_map1" {
  description = "For loop with map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

output "for_output_map2" {
  description = "For loop with map - Advanced"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}

// Splat operator doesn't work for for_each

#Legacy splat operator
# output "legacy_splat_instance_publicdns" {
#   description = "Legacy splat Operator"
#   value = aws_instance.myec2vm.*.public_dns
  
# }

# output "latest_splat_instance_publicdns" {
#   description = "Generalized latest Splat Operator"
#   value = aws_instance.myec2vm[*].public_dns
# }
output "instance_publicip" {
  description = "ec2 instance public ip"
  value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
}

output "instance_publicdns" {
  description = "ec2 instance public DNS"
  value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
}

// Splat operator doesn't work for for_each

output "instance_publicdns2_map" {
  value = {for az, instance in aws_instance.myec2vm: az => instance.public_dns }
}
