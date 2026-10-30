variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}
variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tier              = string
  }))
  validation {
    condition     = alltrue([for s in values(var.subnets) : contains(["public", "app", "db"], s.tier)])
    error_message = "Each subnet tier must be public, app or db."
  }
}
