resource "aws_apigatewayv2_api" "this" {
  name          = "${var.name}__http_api"
  protocol_type = "HTTP"
  cors_configuration {
    allow_origins = var.cors_origins
    allow_methods = var.cors_methods
    allow_headers = var.cors_headers
    max_age = var.max_age
  }
}

resource "aws_apigatewayv2_stage" "this" {
  api_id = aws_apigatewayv2_api.this.id
  name   = "${var.name}__api_stage"
}