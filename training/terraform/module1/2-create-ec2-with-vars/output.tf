# About "output"
# References:
# https://www.terraform.io/language/values/outputs
#########################################################################################
# Output values make information about your infrastructure available on the command line,
# and can expose information for other Terraform configurations to use. Output values are
# similar to return values in programming languages.
#########################################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
output "aws_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "aws_ami_arn" {
  value = data.aws_ami.ubuntu.arn
}

output "aws_ami_creation_date" {
  value = data.aws_ami.ubuntu.creation_date
}

output "aws_ami_image_id" {
  value = data.aws_ami.ubuntu.image_id
}

output "aws_ami_image_type" {
  value = data.aws_ami.ubuntu.image_type
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
output "aws_instance_arn" {
  value = aws_instance.test[*].arn
}

output "aws_instance_private_dns" {
  value = aws_instance.test[*].private_dns
}

output "aws_instance_public_dns" {
  value = aws_instance.test[*].public_dns
}

output "aws_instance_public_ip" {
  value = aws_instance.test[*].public_ip
}

output "aws_instance_tags_all" {
  value = aws_instance.test[*].tags_all
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
output "aws_vpc_arn" {
  value = data.aws_vpc.default.arn
}

output "aws_vpc_id" {
  value = data.aws_vpc.default.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
output "aws_security_group_arn" {
  value = aws_security_group.allow_ssh.arn
}

output "aws_security_group_id" {
  value = aws_security_group.allow_ssh.id
}

output "aws_security_group_tags_all" {
  value = aws_security_group.allow_ssh.tags_all
}
