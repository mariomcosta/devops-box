# About "variable"
# Reference: https://www.terraform.io/language/values/variables
#################################################################################
# Input variables let you customize aspects of Terraform modules without altering
# the module's own source code. This allows you to share modules across different
# Terraform configurations, making your module composable and reusable.
#################################################################################

# Hard defined variable data-type
variable "aws_sg_ingress_rule" {
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
  default = [{
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
}

# More flexibel way to declare a variable
variable "aws_sg_egress_rule" {
  type = any
  default = [{
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
}

variable "aws_sg_tags" {
  type = map(string)
  default = {
    Name = "allow_ssh_terraform"
  }
}

# String data type
variable "aws_instance_type" {
  type    = string
  default = "t3.micro"
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
