# EC2 Auto Scaling Module (CloudieHub)

This Terraform module provisions an **EC2 Auto Scaling Group** in a given VPC using a **Launch Template** and **Security Group**. It is designed to deploy scalable and highly available workloads in AWS.

---

## Features

- Launch Template using the latest Amazon Linux 2 AMI  
- Security Group allowing **SSH** and **HTTP** access  
- Auto Scaling Group with configurable `min`, `max`, and `desired` instance count  
- Optional **user data** for bootstrapping instances  
- Basic **scale-in** and **scale-out policies**  
- Tagging support for all resources  

---

## Resources Created

- `aws_security_group` – Security Group for EC2 instances  
- `aws_launch_template` – Configuration for EC2 instances  
- `aws_autoscaling_group` – Auto Scaling Group for EC2  
- `aws_autoscaling_policy` – Optional scaling policies  

---

## Outputs

- `security_group_id` – ID of the created Security Group  
- `launch_template_id` – ID of the Launch Template  
- `autoscaling_group_name` – Name of the Auto Scaling Group  

---

## Usage

See [`examples/simple`](examples/simple) for a root module that calls this module.
