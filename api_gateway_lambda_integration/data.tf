data "archive_file" "this" {
  count       = var.language == "Node" ? 1 : 0 
  type        = "zip"
  output_path = "${path.root}/files/${var.function_name}.zip"
  source_file = "${path.root}/../backend/dist/pull-translation-function.js"
}