terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "s3-eks-bucket"
    region         = "eu-north-1"
    key            = "devsecops"
    dynamodb_table = "devsecops_table"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}
