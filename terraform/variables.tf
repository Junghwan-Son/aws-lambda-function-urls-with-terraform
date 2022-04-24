variable "aws_profile" {
  type = string
  description = "Profile of awscli"
  default = "default"
}

variable "aws_region" {
  type = string
  description = "Region of aws"
}

variable "function_name" {
  type = string
  description = "The name of function"
}
