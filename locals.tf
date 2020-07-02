locals {
  user_arn_elements = split("/", data.aws_caller_identity.current.arn)
  username          = element(local.user_arn_elements, length(local.user_arn_elements) - 1)
}
