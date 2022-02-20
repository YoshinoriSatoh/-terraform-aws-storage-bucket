variable "tf" {
  description = "Terraformアプリケーション情報"
  type = object({
    name          = string
    shortname     = string
    env           = string
    fullname      = string
    fullshortname = string
  })
}

variable "in_development" {
  description = "S3バケットにオブジェクトが残っていてもバケットごと強制削除されます"
  type        = bool
  default     = false
}

variable "name" {
  type = string
}

variable "versioning" {
  type = object({
    enabled    = string
    mfa_delete = string
  })
  default = {
    enabled    = "Enabled"
    mfa_delete = "Disabled"
  }
}

variable "logging_bucket" {
  type = string
}
