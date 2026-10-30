output "vpc_id" {
  value = module.networking.vpc_id
}

output "nat_gateway_id" {
  value = module.networking.nat_gateway_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
output "api_dns_record_instruction" {
  description = "Create this DNS record at your external DNS provider."
  value       = "CNAME ${var.api_domain} -> ${module.alb.alb_dns_name}"
}
output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "ecs_log_group" {
  value = module.ecs.log_group_name
}

output "rds_endpoint" {
  value = module.database.address
}

output "rds_secret_arn" {
  value = module.database.master_secret_arn
}

output "frontend_bucket" {
  value = module.frontend.bucket_name
}

output "cloudfront_url" {
  value = module.frontend.cloudfront_url
}

output "cloudfront_distribution_id" {
  value = module.frontend.cloudfront_distribution_id
}

output "alert_topic_arn" {
  value = module.monitoring.sns_topic_arn
}
