output "cluster_id" { value = aws_ecs_cluster.main.id }
output "cluster_name" { value = aws_ecs_cluster.main.name }
output "service_name" { value = aws_ecs_service.api.name }
output "service_id" { value = aws_ecs_service.api.id }
output "task_definition_arn" { value = aws_ecs_task_definition.api.arn }
output "log_group_name" { value = aws_cloudwatch_log_group.api.name }
