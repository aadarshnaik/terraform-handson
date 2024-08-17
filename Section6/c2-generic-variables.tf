#AWS Region
variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}

#Environment Variable
variable "environment" {
  description = "Environment variable used as a prefix"
  type = string
  default = "dev"
}

#Business Division
variable "business_division" {
  type = string
  default = "HR"
}