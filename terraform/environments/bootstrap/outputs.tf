output "repository_url" {
  description = "ECR repository URL for Docker push"
  value       = module.ecr.repository_url
}