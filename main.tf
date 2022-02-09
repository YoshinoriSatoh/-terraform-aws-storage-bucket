/**
 * # Terraform AWS Storage buckets module
 *
 * アプリケーション等から使用可能なストレージとしてS3バケットを作成します。
 */

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "default" {
  bucket = var.name
  force_destroy = var.in_development

  versioning {
    enabled = var.versioning.enabled
    mfa_delete = var.versioning.mfa_delete
  }
  logging {
    target_bucket = var.logging_bucket
    target_prefix = var.logging_bucket
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
  depends_on = [
    aws_s3_bucket.default
  ]
}
