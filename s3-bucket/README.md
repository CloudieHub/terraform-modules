# S3 Bucket Module (CloudieHub)

This Terraform module provisions an **AWS S3 bucket** with versioning, optional encryption, lifecycle rules, and optional bucket policies.

---

## Features
- Versioned bucket  
- Server-side encryption (AES256)  
- Lifecycle rules to automatically expire objects  
- Optional bucket policy attachment  
- Tagging support  

---

## Resources Created
- `aws_s3_bucket` – The S3 bucket  
- `aws_s3_bucket_policy` – Optional bucket policy  

---

## Outputs
- `bucket_id` – S3 bucket ID  
- `bucket_arn` – S3 bucket ARN  
- `bucket_name` – S3 bucket name  

---

## Usage
See `examples/simple` for a root module that calls this module.
