variable "name" {
  description = "Bucket name"
  type        = string
}

variable "environment" {
  description = "Env name"
  type        = string
  default     = "dev"
}

variable "absolute_path_custom_authorizer_zip_source" {
  description = "Absolute path to authorizer zip file"
  type        = string
}

variable "custom_authorizer_token" {
  description = "Custom authorizer token"
  type        = string
}
