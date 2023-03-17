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
| [aws_network_interface.test](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/resources/network_interface) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ami_owners"></a> [aws\_ami\_owners](#input\_aws\_ami\_owners) | Canonical Ubuntu account id | `string` | `"099720109477"` | no |
| <a name="input_aws_instance_create"></a> [aws\_instance\_create](#input\_aws\_instance\_create) | Boolean data type | `bool` | n/a | yes |
| <a name="input_aws_instance_filter_tags"></a> [aws\_instance\_filter\_tags](#input\_aws\_instance\_filter\_tags) | Any indicates that we can have any kind of data inside our map() | `map(any)` | <pre>{<br>  "name": "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*",<br>  "virtualization-type": "hvm"<br>}</pre> | no |
| <a name="input_aws_instance_tags"></a> [aws\_instance\_tags](#input\_aws\_instance\_tags) | n/a | `map(string)` | <pre>{<br>  "Name": "HelloTerraform"<br>}</pre> | no |
| <a name="input_aws_instance_type"></a> [aws\_instance\_type](#input\_aws\_instance\_type) | About "variable" Reference: https://www.terraform.io/language/values/variables ################################################################################ Input variables let you customize aspects of Terraform modules without altering the module's own source code. This allows you to share modules across different Terraform configurations, making your module composable and reusable. ################################################################################ String data type | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |

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
<!-- END_TF_DOCS -->