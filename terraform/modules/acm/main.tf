# External DNS workflow: request certificate first, publish CNAME manually,
# then change wait_for_validation to true and apply the certificates root again.
resource "aws_acm_certificate" "api" {
  domain_name       = var.api_domain
  validation_method = "DNS"
  lifecycle { create_before_destroy = true }
  tags = { Name = var.api_domain }
}

resource "aws_acm_certificate_validation" "api" {
  count                   = var.wait_for_validation ? 1 : 0
  certificate_arn         = aws_acm_certificate.api.arn
  validation_record_fqdns = [for d in aws_acm_certificate.api.domain_validation_options : d.resource_record_name]
  timeouts { create = "45m" }
}
