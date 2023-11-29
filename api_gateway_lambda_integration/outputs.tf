output "lambda_iam_role_id" {
  description = "The id of the lambda's IAM role"
  value = aws_iam_role.this.id
}