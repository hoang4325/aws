variable "project_name" {
  description = "Project name used for resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the load balancer is created"
  type        = string
}

variable "public_subnet_ids" {
  description = "Subnet IDs for the internet-facing load balancer"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID assigned to the load balancer"
  type        = string
}

variable "backend_port" {
  description = "Backend application port"
  type        = number
}

variable "certificate_arn" {
  description = "ARN of the validated ACM certificate"
  type        = string
}