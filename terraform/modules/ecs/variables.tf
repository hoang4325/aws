variable "project_name" { type = string }
variable "task_cpu" {
  type    = number
  default = 256
}
variable "task_memory" {
  type    = number
  default = 512
}
variable "backend_port" {
  type    = number
  default = 3000
}
variable "desired_count" {
  type    = number
  default = 1
}
variable "app_subnet_ids" { type = list(string) }
variable "ecs_security_group_id" { type = string }
variable "target_group_arn" { type = string }
variable "container_image" {
  type = string
  validation {
    condition     = length(trimspace(var.container_image)) > 0
    error_message = "container_image is required; push the image to ECR first."
  }
}
variable "db_host" { type = string }
variable "db_name" { type = string }
variable "db_username" { type = string }
variable "db_master_secret_arn" { type = string }
