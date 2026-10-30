variable "project_name" {
  type = string
}

variable "alb_arn_suffix" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "db_identifier" {
  type = string
}
variable "alert_email" {
  type    = string
  default = ""
}
