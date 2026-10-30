output "alb_security_group_id" { value = aws_security_group.tier["alb"].id }
output "ecs_security_group_id" { value = aws_security_group.tier["ecs"].id }
output "rds_security_group_id" { value = aws_security_group.tier["rds"].id }
