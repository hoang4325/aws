variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource tag"
  type        = string
}

variable "subnets" {
  description = "Subnet configuration for the VPC"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tier              = string
  }))
}