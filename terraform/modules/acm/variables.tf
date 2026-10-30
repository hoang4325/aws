variable "api_domain" { type = string }
variable "wait_for_validation" {
  description = "Set true after adding ACM CNAME record to external DNS."
  type        = bool
  default     = false
}
