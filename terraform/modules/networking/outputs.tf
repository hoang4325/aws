output "vpc_id" { value = aws_vpc.main.id }
output "subnet_ids" {
  value = { for k, subnet in aws_subnet.this : k => subnet.id }
}
output "public_subnet_ids" {
  value = [for k, subnet in aws_subnet.this : subnet.id if var.subnets[k].tier == "public"]
}
output "app_subnet_ids" {
  value = [for k, subnet in aws_subnet.this : subnet.id if var.subnets[k].tier == "app"]
}
output "db_subnet_ids" {
  value = [for k, subnet in aws_subnet.this : subnet.id if var.subnets[k].tier == "db"]
}
output "nat_gateway_id" { value = aws_nat_gateway.main.id }
output "route_table_ids" {
  value = { for k, rt in aws_route_table.tier : k => rt.id }
}
