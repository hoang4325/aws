variable "api_domain" {
  description = "Domain name for the backend API"
  type        = string
}

variable "hosted_zone_id" {
  description = "Public Route 53 Hosted Zone ID"
  type        = string
}

variable "container_image" {
  description = "Container image URI deployed to ECS"
  type        = string
}