output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.this.invoke_arn
}

output "api_gateway_url" {
  value = "${aws_api_gateway_deployment.this.invoke_url}/${var.stage_name}/${var.api_path}"
}
