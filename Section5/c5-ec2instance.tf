resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinix2.id
  instance_type = var.instance_type
  # instance_type = var.ec2_instance_type_list[1]
  # instance_type = var.ec2_instance_type_map["prod"]
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  # for_each = toset(data.aws_availability_zones.my_azone.names)
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_typ3:  az => details.instance_types if length(details.instance_types) != 0
  }))
  availability_zone = each.value
  # count = 3
  tags = {
    "Name" = "for_each-Demo-${each.key}"
  }
}