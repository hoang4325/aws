resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = var.db_subnet_ids
  tags = {
    Name = "${var.project_name}-db-subnets"
  }
}

resource "aws_db_instance" "mysql" {
  identifier                  = "${var.project_name}-mysql"
  engine                      = "mysql"
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  storage_type                = "gp2"
  storage_encrypted           = true
  db_name                     = var.db_name
  username                    = var.username
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_security_group_id]
  publicly_accessible    = false
  multi_az               = false # DEV ONLY
  port                   = 3306

  backup_retention_period   = 1
  copy_tags_to_snapshot     = true
  deletion_protection       = var.deletion_protection
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.project_name}-mysql-final"
  apply_immediately         = false
  tags = {
    Name = "${var.project_name}-mysql"
  }
}
