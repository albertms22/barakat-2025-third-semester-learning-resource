terraform {
  required_version = "1.9.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.28.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-state-bucket-12345-barakat"
    dynamodb_table = "terraform-state-locks"
    key            = "terraform-advanced.tfstate"
    region         = "us-east-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

locals {
  project_name = "terraform-handson"
}

# resource "aws_vpc" "the_vpc" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name    = "barakat_vpc"
#     Project = local.project_name
#   }
# }

# resource "aws_vpc" "the_vpc_2" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name    = "barakat_vpc_2"
#     Project = local.project_name
#   }
# }

# resource "aws_vpc" "the_vpc_3" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name    = "barakat_vpc_3"
#     Project = local.project_name
#   }
# }


# output "the_vpc_id" {
#   description = "The ID of the VPC"
#   value       = aws_vpc.the_vpc.id
# }

# cli-variable -> tfvars-file -> environement-variable -> tfvars-default -> default-value -> prompt-for-input
