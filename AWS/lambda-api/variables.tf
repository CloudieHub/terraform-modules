variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "filename" {
  description = "ZIP file of Lambda code"
  type        = string
}

variable "handler" {
  description = "Lambda handler (e.g., index.handler)"
  type        = string
  default     = "index.handler"
}

variable "runtime" {
  description = "Lambda runtime (e.g., nodejs18.x, python3.11)"
  type        = string
  default     = "nodejs18.x"
}

variable "memory_size" {
  description = "Lambda memory in MB"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 10
}

variable "environment" {
  description = "Environment variables for Lambda"
  type        = map(string)
  default     = {}
}

variable "api_path" {
  description = "API Gateway path"
  type        = string
  default     = "lambda"
}

variable "stage_name" {
  description = "API Gateway stage name"
  type        = string
  default     = "prod"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
