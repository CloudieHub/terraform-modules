variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "ACL for the bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
  default     = true
}

variable "encryption" {
  description = "Enable server-side encryption (AES256)"
  type        = bool
  default     = true
}

variable "lifecycle_enabled" {
  description = "Enable lifecycle rule"
  type        = bool
  default     = true
}

variable "lifecycle_days" {
  description = "Days after which objects expire"
  type        = number
  default     = 30
}

variable "enable_policy" {
  description = "Whether to attach a bucket policy"
  type        = bool
  default     = false
}

variable "policy" {
  description = "Bucket policy in JSON"
  type        = any
  default     = {}
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
