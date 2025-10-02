terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ec2_autoscaling" {
  source        = "../.."
  name          = "cloudiehub"
  vpc_id        = "vpc-12345678"
  subnet_ids    = ["subnet-123","subnet-456"]
  instance_type = "t3.micro"
  key_name      = "my-keypair"
  ssh_cidr_blocks = ["YOUR_IP/32"]
  desired_capacity = 2
  min_size = 1
  max_size = 3
  user_data = ""
  tags = { Project = "CloudieHub" }
}

output "autoscaling_group_name" {
  value = module.ec2_autoscaling.autoscaling_group_name
}
