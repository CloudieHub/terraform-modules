variable "name" {
  type        = string
  description = "Name prefix for resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to deploy EC2 instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to deploy instances"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
}

variable "ssh_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "CIDR blocks allowed for SSH"
}

variable "desired_capacity" {
  type        = number
  default     = 1
  description = "Desired number of EC2 instances"
}

variable "min_size" {
  type        = number
  default     = 1
  description = "Minimum number of EC2 instances"
}

variable "max_size" {
  type        = number
  default     = 3
  description = "Maximum number of EC2 instances"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "User data script for EC2 instances"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources"
}
