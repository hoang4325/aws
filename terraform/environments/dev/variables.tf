variable "api_domain" {
  description = "Externally managed public DNS name, e.g. api.example.com"
  type        = string
}
variable "api_certificate_arn" {
  description = "ISSUED ACM cert ARN in ap-southeast-1; obtained from certificates root."
  type        = string
}
variable "container_image" {
  description = "Pushed ECR image with immutable version tag or digest"
  type        = string
  validation {
    condition     = length(trimspace(var.container_image)) > 0
    error_message = "Provide a pushed ECR container image URI."
  }
}
variable "project_name" {
  type    = string
  default = "aws-ecommerce-dev"
}
variable "backend_port" {
  type    = number
  default = 3000
}
variable "desired_count" {
  type    = number
  default = 1
}
variable "task_cpu" {
  type    = number
  default = 256
}
variable "task_memory" {
  type    = number
  default = 512
}
variable "db_instance_class" {
  type    = string
  default = "db.t4g.micro"
}
variable "db_deletion_protection" {
  type    = bool
  default = true
}
variable "db_skip_final_snapshot" {
  type    = bool
  default = false
}
variable "alert_email" {
  type    = string
  default = ""
}
