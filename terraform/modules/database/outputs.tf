output "address" {
  value = aws_db_instance.mysql.address
}

output "identifier" {
  value = aws_db_instance.mysql.identifier
}

output "db_name" {
  value = aws_db_instance.mysql.db_name
}

output "username" {
  value = aws_db_instance.mysql.username
}

output "port" {
  value = aws_db_instance.mysql.port
}
output "master_secret_arn" {
  description = "RDS-managed Secrets Manager secret ARN. Contains password; ARN is not the password."
  value       = aws_db_instance.mysql.master_user_secret[0].secret_arn
}
