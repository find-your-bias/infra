terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {
  #   bucket         = "find-your-bias-terraform-state"
  #   key            = "env/find-your-bias/terraform.tfstate" # choose a path structure per env/project
  #   region         = "us-east-1"
  #   dynamodb_table = "find-your-bias-terraform-locks"
  #   encrypt        = true
  # }
}


provider "aws" {
  region = var.aws_region
}
