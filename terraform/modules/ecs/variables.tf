variable "project_name" {
  description = "Project name used for ECS resource names"
  type        = string
}

variable "task_cpu" {
  description = "CPU units allocated to the Fargate task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory in MiB allocated to the Fargate task"
  type        = number
  default     = 512
}

variable "container_image" {
  description = "Docker image URI used by the ECS task"
  type        = string
  default     = ""
}

variable "backend_port" {
  description = "Port exposed by the Node.js API container"
  type        = number
}

variable "app_subnet_ids" {
  description = "Private application subnet IDs for ECS tasks"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID assigned to ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN for the ECS service"
  type        = string
}