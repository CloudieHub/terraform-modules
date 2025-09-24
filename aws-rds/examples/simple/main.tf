terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Example: Using the VPC module (optional, for reference)
module "vpc" {
  source              = "../../aws-vpc"
  aws_region          = "us-east-1"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnet_cidrs= ["10.0.11.0/24","10.0.12.0/24"]
  enable_nat_gateway  = true
  tags = { Project = "CloudieHub", Environment = "demo" }
}

# Using the RDS module
module "rds" {
  source        = "../.."
  name          = "cloudiehub"
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
  engine        = "mysql"
  engine_version= "8.0"
  instance_class= "db.t3.micro"
  allocated_storage = 20
  username      = "admin"
  password      = "YourSecurePassword123!"
  allowed_cidrs = ["0.0.0.0/0"] # Replace with your office IP in production
  multi_az      = false
  publicly_accessible = false
  tags = { Project = "CloudieHub", Environment = "demo" }
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "db_instance_id" {
  value = module.rds.db_instance_id
}
