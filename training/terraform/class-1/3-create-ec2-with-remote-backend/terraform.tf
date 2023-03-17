terraform {
  backend "s3" {
    bucket         = "hello-terraform-state-backend"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "hello_terraform_state"
  }
}
