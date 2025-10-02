variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region for the resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone for instances"
  type        = string
  default     = "us-central1-a"
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "gcp-instance"
}

variable "machine_type" {
  description = "Machine type for VM"
  type        = string
  default     = "e2-medium"
}

variable "source_image" {
  description = "OS image for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "default"
}

variable "ssh_public_key_path" {
  description = "Path to your public SSH key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "target_size" {
  description = "Number of instances in the group"
  type        = number
  default     = 2
}

variable "min_replicas" {
  description = "Minimum number of VMs in autoscaler"
  type        = number
  default     = 1
}

variable "max_replicas" {
  description = "Maximum number of VMs in autoscaler"
  type        = number
  default     = 5
}
