# RDS Module (CloudieHub)

This Terraform module provisions an **AWS RDS instance** with a subnet group and security group.  
Designed to deploy a managed relational database (MySQL/PostgreSQL) inside a VPC.

---

## Features
- Managed RDS instance with configurable engine, version, and instance class  
- DB Subnet Group for private subnets  
- Security Group restricting access to allowed CIDRs  
- Optional Multi-AZ deployment  
- Tagging support for all resources  

---

## Resources Created
- `aws_db_instance` – The RDS instance  
- `aws_db_subnet_group` – DB subnet group for private subnets  
- `aws_security_group` – Security group for DB access  

---

## Outputs
- `db_instance_id` – RDS instance ID  
- `db_endpoint` – RDS endpoint for connections  
- `db_port` – Database port  
- `security_group_id` – Security Group ID  

---

## Usage
See `examples/simple` for a root module that calls this module.
