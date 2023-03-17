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
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.aws_instance_type
  tags                   = var.aws_instance_tags

  network_interface {
    network_interface_id = aws_network_interface.test.id
    device_index         = 0
  }
}

resource "aws_network_interface" "test" {
  subnet_id   = var.subnet_id
  tags = {
    Name = "primary_network_interface"
  }
}