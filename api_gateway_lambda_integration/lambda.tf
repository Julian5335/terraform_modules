resource "aws_iam_role" "this" {
  name = "${var.function_name}__lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Node
resource "aws_lambda_permission" "node" {
  count = var.language == "Node" ? [1] : []
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.node.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.execution_arn}/*/*"
}

resource "aws_lambda_function" "node" {
  count            = var.language == "Node" ? [1] : 0
  function_name    = "${var.function_name}__node_lambda_function"
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
  description      = "${var.function_name} lambda function"
  role             = aws_iam_role.this.arn
  runtime          = var.runtime
  handler          = var.handler
  timeout          = var.timeout
}

#  Java
resource "aws_lambda_permission" "java" {
  count = var.language == "Java" ? [1] : []
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.java.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.execution_arn}/*/*"
}

resource "aws_lambda_function" "java" {
  count            = var.language == "Java" ? [1] : 0
  function_name    = "${var.function_name}__java_lambda_function"
  filename         = "./target/${var.function_name}.jar"
  description      = "${var.function_name} lambda function"
  role             = aws_iam_role.this.arn
  runtime          = var.runtime
  handler          = var.handler
  timeout          = var.timeout
}