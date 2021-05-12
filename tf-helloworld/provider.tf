terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.65.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                  = var.aws_region
  profile                 = var.aws_profile
  shared_credentials_file = var.aws_creds_file
}