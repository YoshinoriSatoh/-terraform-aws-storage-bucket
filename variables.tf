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
  type = bool
  default = false
}

variable "name" {
  type = string
}

variable "versioning" {
  type = object({
    enabled = bool
    mfa_delete = bool
  })
  default = {
    enabled = true
    mfa_delete = false
  }
}

variable "logging_bucket" {
  type = string
}
