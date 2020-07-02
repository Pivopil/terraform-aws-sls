output "rest_api_id" {
  description = "Endpoint for POST calls with binary content with content-type heder and protected by Authorization header"
  value       = "https://${aws_api_gateway_rest_api.s3_filing_proxy_api_gateway.id}.execute-api.${data.aws_region.current.name}.amazonaws.com/${var.environment}/content/{file}"
}

output "bucket_id" {
  description = "Bucket id"
  value       = aws_s3_bucket.filing_content_bucket.id
}


