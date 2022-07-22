# Terrafrom module 1

## Table of contents

- [Quick start](#quick-start)
- [Status](#status)
- [What's included](#whats-included)
- [How to use each example](#How-to-use-each-example)
- [Contributing](#contributing)
- [Creators](#creators)
- [Thanks](#thanks)

## Quick start

Here we have three examples of Terraform usage, beginning from `0-s3-and-dynamodb` where we have the simplest way to write your code, set up your provider, and create your infrastructure. Going through the next folders we'll see the concept of `variables` and its data type and structure, `output` from a data resource, from a resource and from a list of resources, `loop structures`, and `remote backend using s3 and dynamodb`.

- 0-s3-and-dynamodb
- 1-create-ec2
- 2-create-ec2-with-vars
- 3-create-ec2-with-remote-backend

## What's in module 1

Here we have Terraform files and README.md containing TF documentation for each example folder.

```text
└── module1
    ├── 0-s3-and-dynamodb
    │   ├── README.md
    │   ├── dynamodb-lock.tf
    │   ├── remove.bucket.sh
    │   ├── s3-backend.tf
    ├── 1-create-ec2
    │   ├── README.md
    │   ├── main.tf
    │   └── providers.tf
    ├── 2-create-ec2-with-vars
    │   ├── README.md
    │   ├── main.tf
    │   ├── output.tf
    │   ├── providers.tf
    │   └── variables.tf
    └── 3-create-ec2-with-remote-backend
        ├── README.md
        ├── main.tf
        ├── output.tf
        ├── providers.tf
        ├── terraform.tf
        └── variables.tf
```

## How to use each example
`0-s3-and-dynamodb` it's only a requirement for the third example, so having it in mind, just do like this:

Move to the folder you want to test, for example, the second one
```sh
cd 2-create-ec2-with-vars
```

To initialize your setup, downloading your providers libraries and other all dependencies just run:
```sh
terraform init
```
and you should see something like:
```text
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.22.0

Terraform has been successfully initialized!
````

Now it's time to plan (compare your code to what you actually have in your infrastructure, based on your .tfstate file) and show what you have to add, change or destroy:
```sh
terraform plan
````
and you should see something like:
```text
Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aws_ami_arn                 = "arn:aws:ec2:us-west-2::image/ami-0aab355e1bfa1e72e"
  + aws_ami_creation_date       = "2022-07-07T00:49:19.000Z"
  + aws_ami_id                  = "ami-0aab355e1bfa1e72e"
  + aws_ami_image_id            = "ami-0aab355e1bfa1e72e"
  + aws_ami_image_type          = "machine"
  ...
  + aws_security_group_arn      = (known after apply)
  + aws_security_group_id       = (known after apply)
  + aws_security_group_tags_all = {
      + "Name" = "allow_ssh_terraform"
    }
  + aws_vpc_arn                 = "arn:aws:ec2:us-west-2:00000000000:vpc/vpc-123456"
  + aws_vpc_id                  = "vpc-123456"
```

To apply your code, by deafult it'will run a plan again and ask you if really want to proceed:
```sh
terraform apply
```
You should see an output like this if everything goes ok:
```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

aws_ami_arn = "arn:aws:ec2:us-west-2::image/ami-65767890123413"
aws_ami_creation_date = "2022-07-07T00:49:19.000Z"
aws_ami_id = "ami-65767890123413"
aws_ami_image_id = "ami-65767890123413"
aws_ami_image_type = "machine"
.....
aws_security_group_arn = "arn:aws:ec2:us-west-2:02130984809:security-group/sg-004423094823094823"
aws_security_group_id = "sg-004423094823094823"
aws_security_group_tags_all = tomap({
  "Name" = "allow_ssh_terraform"
})
aws_vpc_arn = "arn:aws:ec2:us-west-2:75643:vpc/vpc-fh128710"
aws_vpc_id = "vpc-fh128710"
```
## Bugs and feature requests

Have a bug or a feature request? Please first read the [issue guidelines](https://reponame/blob/master/CONTRIBUTING.md) and search for existing and closed issues. If your problem or idea is not addressed yet, [please open a new issue](https://reponame/issues/new).

## Contributing

Please read through our [contributing guidelines](https://reponame/blob/master/CONTRIBUTING.md). Included are directions for opening issues, coding standards, and notes on development.

Moreover, all HTML and CSS should conform to the [Code Guide](https://github.com/mdo/code-guide), maintained by [Main author](https://github.com/usernamemainauthor).

Editor preferences are available in the [editor config](https://reponame/blob/master/.editorconfig) for easy use in common text editors. Read more and download plugins at <https://editorconfig.org/>.

## Creators
- <https://github.com/mariomcosta>

## Thanks

Thanks to Techops Team