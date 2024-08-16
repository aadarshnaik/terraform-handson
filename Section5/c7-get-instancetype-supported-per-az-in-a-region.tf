#Datasource

//Get the list of availability zone names
data "aws_availability_zones" "az_names" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


// Check 
data "aws_ec2_instance_type_offerings" "my_ins_typ3" {

    for_each = toset(data.aws_availability_zones.az_names.names)

  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    # values = ["us-east-1a"]
    values = [each.key]
  }

  location_type = "availability-zone"
}

# This will show all the AZ where t3 micro is supported
output "output_v3_1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_typ3:  az => details.instance_types
  }
}

# To exclude the unsupported AZ for a type of instance
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_typ3:  az => details.instance_types if length(details.instance_types) != 0
  }
}

# Keys function will bet only keys from a map
output "output_v3_3" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_typ3:  az => details.instance_types if length(details.instance_types) != 0
  })
}


#For learning purposes
output "output_v3_4" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_typ3:  
    az => details.instance_types if length(details.instance_types) != 0
  })[0]
}