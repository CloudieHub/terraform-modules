# S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
  tags   = merge(var.tags, { Name = var.bucket_name })

  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.encryption ? "AES256" : null
      }
    }
  }

  lifecycle_rule {
    id      = "expire-objects"
    enabled = var.lifecycle_enabled
    expiration {
      days = var.lifecycle_days
    }
  }
}

# Optional Bucket Policy
resource "aws_s3_bucket_policy" "this" {
  count  = var.enable_policy ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = jsonencode(var.policy)
}
