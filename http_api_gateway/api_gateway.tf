resource "aws_apigatewayv2_api" "this" {
  name          = "${var.name}__http_api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "this" {
  api_id = aws_apigatewayv2_api.this.id
  name   = "${var.name}__api_stage"
}