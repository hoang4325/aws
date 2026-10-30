output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value = {
    for key, subnet in aws_subnet.this :
    key => subnet.id
  }
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [
    for key, subnet in aws_subnet.this :
    subnet.id
    if var.subnets[key].tier == "public"
  ]
}

output "app_subnet_ids" {
  description = "IDs of application subnets"
  value = [
    for key, subnet in aws_subnet.this :
    subnet.id
    if var.subnets[key].tier == "app"
  ]
}

output "db_subnet_ids" {
  description = "IDs of database subnets"
  value = [
    for key, subnet in aws_subnet.this :
    subnet.id
    if var.subnets[key].tier == "db"
  ]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.main.id
}

output "route_table_ids" {
  description = "IDs of the route tables"
  value = {
    for key, rt in aws_route_table.tier :
    key => rt.id
  }
}
