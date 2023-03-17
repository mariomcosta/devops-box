# About "variable"
# Reference: https://www.terraform.io/language/values/variables
#################################################################################
# Input variables let you customize aspects of Terraform modules without altering
# the module's own source code. This allows you to share modules across different
# Terraform configurations, making your module composable and reusable.
#################################################################################
# String data type
variable "aws_instance_type" {
  type = string
}

# Boolean data type
variable "aws_instance_create" {
  type = bool
}

# Any indicates that we can have any kind of data inside our map()
variable "aws_instance_filter_tags" {
  type = map(any)
  default = {
    "name"                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    "virtualization-type" = "hvm"
  }
}
variable "aws_instance_tags" {
  type = map(string)
  default = {
    Name = "HelloTerraform"
  }
}

# Canonical Ubuntu account id
variable "aws_ami_owners" {
  type    = string
  default = "099720109477"
}

variable "subnet_id" {
  type = string
}

variable "subnet_cidr" {
  type = string
}
