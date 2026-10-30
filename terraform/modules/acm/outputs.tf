output "certificate_arn" {
  description = "Certificate ARN. Only use with ALB after ACM status becomes ISSUED."
  value = var.wait_for_validation ? (
    aws_acm_certificate_validation.api[0].certificate_arn
  ) : aws_acm_certificate.api.arn
}
output "validation_records" {
  description = "Publish these CNAME records at your EXTERNAL DNS provider."
  value = {
    for d in aws_acm_certificate.api.domain_validation_options : d.domain_name => {
      name  = d.resource_record_name
      type  = d.resource_record_type
      value = d.resource_record_value
    }
  }
}
