# terraform-aws-sls
Custom Terraform AWS Module for Serverless

## Configure Terraform Provider
```
export AWS_PROFILE="training-aws"
export AWS_DEFAULT_REGION="eu-central-1"
```
or change main.tf like this
```
provider "aws" {
  region  = "eu-central-1"
  profile = "training-aws"
}
```

## Configure Terraform variables
```
export TF_VAR_name="aws-training"
export TF_VAR_custom_authorizer_token="super-secure-token"
export TF_VAR_absolute_path_custom_authorizer_zip_source="/path/to/authorizer.zip"
```
## Init
```
terraform init
```

## Plan
```
terraform plan
```

## Apply
```
terraform apply -auto-approve
```

## Destroy
```
terraform destroy -auto-approve
```

## Links

### Lambda Video
https://www.youtube.com/watch?v=QdzV04T_kec
- compute service that lets you run code without provisioning or managing servers.

### Lambda CloudFormation
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_Lambda.html

#### Concepts
https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-concepts.html

#### Execution role
https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html

#### View own IAM permissions
https://docs.aws.amazon.com/lambda/latest/dg/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-view-own-permissions

#### Identity-based IAM policies for AWS Lambda
https://docs.aws.amazon.com/lambda/latest/dg/access-control-identity-based.html


####
https://github.com/awsdocs/aws-lambda-developer-guide/tree/master/sample-apps/efs-nodejs

https://docs.aws.amazon.com/lambda/latest/dg/limits.html

### API Gateway
https://www.youtube.com/watch?v=XwfpPEFHKtQ

### Lambda Binary package
https://aws.amazon.com/premiumsupport/knowledge-center/lambda-linux-binary-package/ 


https://www.terraform.io/docs/providers/aws/r/api_gateway_method_response.html

https://www.endava.com/en/blog/Engineering/2019/AWS-serverless-with-Terraform

https://medium.com/rockedscience/api-gateway-logging-with-terraform-d13f7701ed0b


https://www.terraform.io/docs/providers/aws/r/lambda_function.html

https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
