data "aws_iam_policy_document" "lambda_sts_policy" {
  version = "2012-10-17"
  statement {
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
  }
}

data "aws_iam_policy_document" "iam_lambda_execution_role_policy_document" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_s3_bucket" "lambda_sorces_bucket" {
  acl = "private"
}

resource "aws_s3_bucket_object" "lambda_sorces" {
  acl    = "private"
  bucket = aws_s3_bucket.lambda_sorces_bucket.id
  key    = "authorizer.zip"
  source = var.custom_authorizer_zip_source
}

resource "aws_cloudwatch_log_group" "custom_authorizer_log_group" {
  name              = "/aws/lambda/aws_training_custom_authorizer"
  retention_in_days = 1
}

resource "aws_iam_role" "iam_role_lambda_execution" {
  assume_role_policy = data.aws_iam_policy_document.lambda_sts_policy.json
}

resource "aws_iam_role_policy" "iam_role_lambda_execution_policy" {
  name   = "iam_lambda_execution_role_policy"
  role   = aws_iam_role.iam_role_lambda_execution.id
  policy = data.aws_iam_policy_document.iam_lambda_execution_role_policy_document.json
}

resource "aws_lambda_function" "custom_authorizer" {
  s3_key        = "authorizer.zip"
  s3_bucket     = aws_s3_bucket.lambda_sorces_bucket.id
  function_name = "custom_authorizer"
  handler       = "authorizer.auth"
  role          = aws_iam_role.iam_role_lambda_execution.arn
  runtime       = "python3.7"
  memory_size   = 1024
  timeout       = 30
  environment {
    variables = {
      token = var.custom_authorizer_token
    }
  }
}
