# About "data"
# Reference: https://www.terraform.io/language/providers
###########################################################################
# Terraform relies on plugins called "providers" to interact with cloud
# providers, SaaS providers, and other APIs.
# Terraform configurations must declare which providers they require so that
# Terraform can install and use them. Additionally, some providers require
# configuration (like endpoint URLs or cloud regions) before they can be used.
##############################################################################

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}