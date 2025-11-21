# Terrsform configuration for AWS provider
terraform {
  required_version = "1.9.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.28.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

data "aws_availability_zones" "ohio" {}
data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "barakat" {
  cidr_block = data.aws_vpc.default.cidr_block
  tags = {
    Name    = "barakat_vpc"
    Project = "terraform-handson"
  }
}

resource "aws_subnet" "barakat_one" {
  vpc_id            = aws_vpc.barakat.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.ohio.names[0]
  tags = {
    Name    = "barakat_subnet_one"
    Project = "terraform-handson"
  }
}

resource "aws_instance" "barakat_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.barakat_one.id

  tags = {
    Name    = "barakat_instance"
    Project = "terraform-handson"
  }
}
