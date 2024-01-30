variable "api_id" {
  type = string
  description = "The id of the api gateway"
}

variable "route_key" {
  type = string
  description = "The http method and path. Eg: 'Get /api/todos'"
}

variable "execution_arn" {
  type = string
  description = "The execution_arn of the api gateway"
}

variable "function_name" {
  type = string
  description = "Name of the lambda function"
}

variable "runtime" {
  type = string
  description = "Node runtime of the lambda function"
  default = "nodejs20.x"
}

variable "timeout" {
  type = number
  description = "Timeout duration of the lambda function"
  default = 15
}

variable "handler" {
  type = string
  description = "Handler of the lambda function"
  default = "index.handler"
}