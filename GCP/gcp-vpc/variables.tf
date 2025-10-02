variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "cloudiehub-vpc"
}

variable "subnet_cidrs" {
  description = "List of subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
