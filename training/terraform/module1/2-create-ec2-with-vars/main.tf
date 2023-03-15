# About "data"
# Reference: https://learn.hashicorp.com/tutorials/terraform/data-sources
##############################################################################
# Terraform uses data sources to fetch information from cloud provider APIs,
# such as disk image IDs, or information about the rest of your infrastructure
# through the outputs of other Terraform configurations.
# Data sources allow you to load data from APIs or other Terraform workspaces.
##############################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = [var.aws_ami_owners]
  dynamic "filter" {
    for_each = var.aws_instance_filter_tags
    iterator = tag
    content {
      name   = tag.key
      values = [tag.value]
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
data "aws_vpc" "default" {
  default = true
}

# About "resource"
# Reference: https://www.terraform.io/language/resources
###################################################################################
# Resources are the most important element in the Terraform language.
# Each resource block describes one or more infrastructure objects,
# such as virtual networks, compute instances, or higher-level components
# such as DNS records. Resource Blocks documents the syntax for declaring resources.
###################################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "test" {
  count = var.aws_instance_create ? 1 : 0

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.aws_instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags                   = var.aws_instance_tags
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_terraform"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  ingress     = var.aws_sg_ingress_rule
  egress      = var.aws_sg_egress_rule
  tags        = var.aws_sg_tags
}

