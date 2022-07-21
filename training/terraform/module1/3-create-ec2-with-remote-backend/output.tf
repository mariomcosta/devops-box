# About "output"
# References:
# https://www.terraform.io/language/values/outputs
#########################################################################################
# Output values make information about your infrastructure available on the command line,
# and can expose information for other Terraform configurations to use. Output values are
# similar to return values in programming languages.
#########################################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

# is set to the ID of the found AMI
output "aws_ami_id" {
  value = data.aws_ami.ubuntu.id
}

# The ARN of the AMI
output "aws_ami_arn" {
  value = data.aws_ami.ubuntu.arn
}

# The date and time the image was created.
output "aws_ami_creation_date" {
  value = data.aws_ami.ubuntu.creation_date
}

# The ID of the AMI. Should be the same as the resource id
output "aws_ami_image_id" {
  value = data.aws_ami.ubuntu.image_id
}

# The type of image
output "aws_ami_image_type" {
  value = data.aws_ami.ubuntu.image_type
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

# The ARN of the instance
output "aws_instance_arn" {
  value = aws_instance.test[*].arn
}

# The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC
output "aws_instance_private_dns" {
  value = aws_instance.test[*].private_dns
}

# The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC
output "aws_instance_public_dns" {
  value = aws_instance.test[*].public_dns
}

# The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use public_ip as this field will change after the EIP is attached
output "aws_instance_public_ip" {
  value = aws_instance.test[*].public_ip
}

# A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block
output "aws_instance_tags_all" {
  value = aws_instance.test[*].tags_all
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

# Amazon Resource Name (ARN) of VPC
output "aws_vpc_arn" {
  value = data.aws_vpc.default.arn
}

# The ID of the VPC
output "aws_vpc_id" {
  value = data.aws_vpc.default.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

# ARN of the security group
output "aws_security_group_arn" {
  value = aws_security_group.allow_ssh.arn
}

# ID of the security group
output "aws_security_group_id" {
  value = aws_security_group.allow_ssh.id
}

# A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block
output "aws_security_group_tags_all" {
  value = aws_security_group.allow_ssh.tags_all
}