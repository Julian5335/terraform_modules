data "archive_file" "this" {
  type        = "zip"
  output_path = "${path.root}/files/${var.function_name}.zip"
  source_file = "${path.root}/../backend/dist/${var.file_name}.js"
}