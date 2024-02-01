resource "aws_apigatewayv2_integration" "this" {
  api_id             = var.api_id
  integration_type   = "AWS_PROXY"
  connection_type    = "INTERNET"
  description        = "Lambda integration for ${var.function_name}"
  integration_method = "POST"
  integration_uri    = aws_lambda_function.this.invoke_arn
}

resource "aws_apigatewayv2_route" "this" {
  api_id    = var.api_id
  route_key = var.route_key
  target    = "integrations/${aws_apigatewayv2_integration.this.id}"
}