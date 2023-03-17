<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.test](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/resources/instance) | resource |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ami_owners"></a> [aws\_ami\_owners](#input\_aws\_ami\_owners) | Canonical Ubuntu account id | `string` | `"099720109477"` | no |
| <a name="input_aws_instance_create"></a> [aws\_instance\_create](#input\_aws\_instance\_create) | Boolean data type | `bool` | n/a | yes |
| <a name="input_aws_instance_filter_tags"></a> [aws\_instance\_filter\_tags](#input\_aws\_instance\_filter\_tags) | Any indicates that we can have any kind of data inside our map() | `map(any)` | <pre>{<br>  "name": "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*",<br>  "virtualization-type": "hvm"<br>}</pre> | no |
| <a name="input_aws_instance_tags"></a> [aws\_instance\_tags](#input\_aws\_instance\_tags) | n/a | `map(string)` | <pre>{<br>  "Name": "HelloTerraform"<br>}</pre> | no |
| <a name="input_aws_instance_type"></a> [aws\_instance\_type](#input\_aws\_instance\_type) | String data type | `string` | n/a | yes |
| <a name="input_aws_sg_egress_rule"></a> [aws\_sg\_egress\_rule](#input\_aws\_sg\_egress\_rule) | More flexibel way to declare a variable | <pre>list(object({<br>    description      = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    prefix_list_ids  = list(string)<br>    security_groups  = list(string)<br>    self             = bool<br>  }))</pre> | n/a | yes |
| <a name="input_aws_sg_ingress_rule"></a> [aws\_sg\_ingress\_rule](#input\_aws\_sg\_ingress\_rule) | Hard defined variable data-type | <pre>list(object({<br>    description      = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    prefix_list_ids  = list(string)<br>    security_groups  = list(string)<br>    self             = bool<br>  }))</pre> | n/a | yes |
| <a name="input_aws_sg_tags"></a> [aws\_sg\_tags](#input\_aws\_sg\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_aws_vpc_arn"></a> [aws\_vpc\_arn](#input\_aws\_vpc\_arn) | n/a | `string` | n/a | yes |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ami_arn"></a> [aws\_ami\_arn](#output\_aws\_ami\_arn) | The ARN of the AMI |
| <a name="output_aws_ami_creation_date"></a> [aws\_ami\_creation\_date](#output\_aws\_ami\_creation\_date) | The date and time the image was created. |
| <a name="output_aws_ami_id"></a> [aws\_ami\_id](#output\_aws\_ami\_id) | is set to the ID of the found AMI |
| <a name="output_aws_ami_image_id"></a> [aws\_ami\_image\_id](#output\_aws\_ami\_image\_id) | The ID of the AMI. Should be the same as the resource id |
| <a name="output_aws_ami_image_type"></a> [aws\_ami\_image\_type](#output\_aws\_ami\_image\_type) | The type of image |
| <a name="output_aws_instance_arn"></a> [aws\_instance\_arn](#output\_aws\_instance\_arn) | The ARN of the instance |
| <a name="output_aws_instance_private_dns"></a> [aws\_instance\_private\_dns](#output\_aws\_instance\_private\_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_aws_instance_public_dns"></a> [aws\_instance\_public\_dns](#output\_aws\_instance\_public\_dns) | The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_aws_instance_public_ip"></a> [aws\_instance\_public\_ip](#output\_aws\_instance\_public\_ip) | The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use public\_ip as this field will change after the EIP is attached |
| <a name="output_aws_instance_tags_all"></a> [aws\_instance\_tags\_all](#output\_aws\_instance\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
| <a name="output_aws_security_group_arn"></a> [aws\_security\_group\_arn](#output\_aws\_security\_group\_arn) | ARN of the security group |
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | ID of the security group |
| <a name="output_aws_security_group_tags_all"></a> [aws\_security\_group\_tags\_all](#output\_aws\_security\_group\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block |
<!-- END_TF_DOCS -->