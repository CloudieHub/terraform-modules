# Lambda + API Gateway Module (CloudieHub)

This Terraform module deploys a **serverless API** using AWS Lambda and API Gateway.  
It allows you to run Lambda functions triggered via HTTP requests.

---

## Features
- Deploy Lambda function with configurable runtime, memory, and timeout  
- Environment variable support  
- API Gateway with a GET endpoint for Lambda  
- IAM Role and policy for Lambda execution  
- Tagging support  

---

## Resources Created
- `aws_lambda_function` – Lambda function  
- `aws_iam_role` – IAM role for Lambda  
- `aws_api_gateway_rest_api` – API Gateway  
- `aws_api_gateway_resource` – API Gateway resource  
- `aws_api_gateway_method` – API Gateway method  
- `aws_api_gateway_integration` – Lambda integration  
- `aws_api_gateway_deployment` – API deployment  

---

## Outputs
- `lambda_function_name` – Name of Lambda function  
- `lambda_invoke_arn` – Lambda ARN for direct invocation  
- `api_gateway_url` – URL of API endpoint  

---

## Usage
See `examples/simple` for a root module that calls this module.
