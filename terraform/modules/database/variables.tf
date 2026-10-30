variable "project_name" {
  type = string
}

variable "db_subnet_ids" {
  type = list(string)
}

variable "rds_security_group_id" {
  type = string
}
variable "instance_class" {
  type    = string
  default = "db.t4g.micro"
}
variable "allocated_storage" {
  type    = number
  default = 20
}
variable "db_name" {
  type    = string
  default = "ecommerce"
}
variable "username" {
  type    = string
  default = "ecommerceadmin"
}
variable "deletion_protection" {
  type    = bool
  default = true
}
variable "skip_final_snapshot" {
  type    = bool
  default = false
}
