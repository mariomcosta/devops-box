locals {
  ##### common #####
  tags = {
    "resource"     = "devops-class"
    "class-module" = "2"
  }
  ##### compute #####
  region          = "us-west-2"
  vpc_cidr        = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  aws_sg_ingress_rule = [{
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

  aws_sg_egress_rule = [{
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
  aws_sg_tags = {
    Name = "allow_ssh_terraform"
  }

  aws_instance_type = "t3.micro"

  aws_instance_create = true

  aws_instance_filter_tags = {
    "name"                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
    "virtualization-type" = "hvm"
  }

  aws_instance_tags = {
    Name = "HelloTerraform"
  }

  # Canonical Ubuntu account id
  aws_ami_owners = "099720109477"
}
