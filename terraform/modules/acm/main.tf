resource "aws_acm_certificate" "api" {
  domain_name       = var.api_domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  api_validation = one(
    aws_acm_certificate.api.domain_validation_options
  )
}

resource "aws_route53_record" "api_validation" {
  zone_id = var.hosted_zone_id

  name    = local.api_validation.resource_record_name
  type    = local.api_validation.resource_record_type
  records = [local.api_validation.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "api" {
  certificate_arn = aws_acm_certificate.api.arn
  validation_record_fqdns = [
    aws_route53_record.api_validation.fqdn
  ]
}