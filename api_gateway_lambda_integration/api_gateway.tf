# Node
resource "aws_apigatewayv2_integration" "node" {
  count = var.language == "Node" ? [1] : 0
  api_id             = var.api_id
  integration_type   = "AWS_PROXY"
  connection_type    = "INTERNET"
  description        = "Lambda integration for ${var.function_name}"
  integration_method = "POST"
  integration_uri    = aws_lambda_function.node.invoke_arn
}

resource "aws_apigatewayv2_route" "node" {
  count = var.language == "Node" ? [1] : 0
  api_id    = var.api_id
  route_key = var.route_key
  target    = "integrations/${aws_apigatewayv2_integration.node.id}"
}

# Java
resource "aws_apigatewayv2_integration" "java" {
  count = var.language == "Java" ? [1] : 0
  api_id             = var.api_id
  integration_type   = "AWS_PROXY"
  connection_type    = "INTERNET"
  description        = "Lambda integration for ${var.function_name}"
  integration_method = "POST"
  integration_uri    = aws_lambda_function.java.invoke_arn
}

resource "aws_apigatewayv2_route" "java" {
  count = var.language == "Java" ? [1] : 0
  api_id    = var.api_id
  route_key = var.route_key
  target    = "integrations/${aws_apigatewayv2_integration.java.id}"
}