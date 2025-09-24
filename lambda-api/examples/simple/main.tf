terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Example Lambda function code (local ZIP file)
# Make sure you have a 'lambda.zip' with an index.js (Node.js) or main.py (Python)
# Example Node.js handler: exports.handler = async (event) => { return { statusCode: 200, body: "Hello from CloudieHub Lambda!" }; };

module "lambda_api" {
  source      = "../.."
  name        = "cloudiehub"
  filename    = "lambda.zip"
  handler     = "index.handler"
  runtime     = "nodejs18.x"
  memory_size = 128
  timeout     = 10
  api_path    = "hello"
  stage_name  = "prod"
  environment = {
    ENV = "demo"
  }
  tags = { Project = "CloudieHub", Environment = "demo" }
}

output "lambda_function_name" {
  value = module.lambda_api.lambda_function_name
}

output "lambda_invoke_arn" {
  value = module.lambda_api.lambda_invoke_arn
}

output "api_gateway_url" {
  value = module.lambda_api.api_gateway_url
}
