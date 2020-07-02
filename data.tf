data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "apigateway_sts_policy" {
  version = "2012-10-17"
  statement {
    principals {
      identifiers = [
      "apigateway.amazonaws.com"]
      type = "Service"
    }
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]
  }
}


