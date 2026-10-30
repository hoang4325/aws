resource "aws_security_group" "tier" {
  for_each = toset(["alb", "ecs", "rds"])
  name     = "${var.project_name}-${each.key}-sg"
  vpc_id   = var.vpc_id
  tags     = { Name = "${var.project_name}-${each.key}-sg" }
}
# Ingress
resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.tier["alb"].id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}
resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb" {
  security_group_id            = aws_security_group.tier["ecs"].id
  referenced_security_group_id = aws_security_group.tier["alb"].id
  ip_protocol                  = "tcp"
  from_port                    = var.backend_port
  to_port                      = var.backend_port
}
resource "aws_vpc_security_group_ingress_rule" "rds_from_ecs" {
  security_group_id            = aws_security_group.tier["rds"].id
  referenced_security_group_id = aws_security_group.tier["ecs"].id
  ip_protocol                  = "tcp"
  from_port                    = 3306
  to_port                      = 3306
}
# Egress
resource "aws_vpc_security_group_egress_rule" "alb_to_ecs" {
  security_group_id            = aws_security_group.tier["alb"].id
  referenced_security_group_id = aws_security_group.tier["ecs"].id
  ip_protocol                  = "tcp"
  from_port                    = var.backend_port
  to_port                      = var.backend_port
}
resource "aws_vpc_security_group_egress_rule" "ecs_to_rds" {
  security_group_id            = aws_security_group.tier["ecs"].id
  referenced_security_group_id = aws_security_group.tier["rds"].id
  ip_protocol                  = "tcp"
  from_port                    = 3306
  to_port                      = 3306
}
resource "aws_vpc_security_group_egress_rule" "ecs_https" {
  security_group_id = aws_security_group.tier["ecs"].id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}
# RDS does not initiate outbound connections in this lab. Return traffic is stateful.
