variable "name" {
  type = string
  description = "Name of the api"
}

variable "cors_origins" {
  type = list(string)
  default = [ "*" ]
}

variable "cors_methods" {
  type = list(string)
  default = [ "OPTIONS", "GET", "POST", "PUT", "DELETE" ]
}

variable "cors_headers" {
  type = list(string)
  default = [ "content-type" ]
}

variable "max_age" {
  type = number
  default = 60
}