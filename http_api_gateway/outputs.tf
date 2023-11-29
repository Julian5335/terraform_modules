output "api_id" {
  value = aws_apigatewayv2_api.this.id
}

output "invoke_url" {
  value = aws_apigatewayv2_stage.this.invoke_url
}