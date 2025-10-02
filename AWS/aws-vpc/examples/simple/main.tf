terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "../.."
  aws_region          = "us-east-1"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnet_cidrs= ["10.0.11.0/24","10.0.12.0/24"]
  enable_nat_gateway  = true
  tags = { Project = "cloudiehub", Environment = "demo" }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
