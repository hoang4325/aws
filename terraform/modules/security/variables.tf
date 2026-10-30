variable "vpc_id" {
  description = "VPC ID for security groups"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource names"
  type        = string
}

variable "backend_port" {
  description = "Backend application port"
  type        = number
}