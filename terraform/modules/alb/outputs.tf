output "alb_dns_name" {
  description = "DNS name of Application Load Balancer"
  value       = aws_lb.api.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of Application Load Balancer"
  value       = aws_lb.api.zone_id
}

output "target_group_arn" {
  description = "ARN of the target group for the Application Load Balancer"
  value       = aws_lb_target_group.api.arn
}

output "https_listener_arn" {
  description = "ARN of the HTTPS listener for the Application Load Balancer"
  value       = aws_lb_listener.https.arn
}