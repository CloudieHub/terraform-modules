terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Using the S3 Bucket module
module "s3_bucket" {
  source      = "../.."
  bucket_name = "cloudiehub-portfolio-demo"
  acl         = "private"
  versioning  = true
  encryption  = true
  lifecycle_enabled = true
  lifecycle_days    = 60
  enable_policy     = false
  tags = {
    Project     = "CloudieHub"
    Environment = "demo"
  }
}

output "bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "bucket_name" {
  value = module.s3_bucket.bucket_name
}
