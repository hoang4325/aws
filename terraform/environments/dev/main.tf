locals {
  subnets = {
    "public-a" = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-southeast-1a"
      tier              = "public"
    }
    "public-b" = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "ap-southeast-1b"
      tier              = "public"
    }
    "app-a" = {
      cidr_block        = "10.0.11.0/24"
      availability_zone = "ap-southeast-1a"
      tier              = "app"
    }
    "app-b" = {
      cidr_block        = "10.0.12.0/24"
      availability_zone = "ap-southeast-1b"
      tier              = "app"
    }
    "db-a" = {
      cidr_block        = "10.0.21.0/24"
      availability_zone = "ap-southeast-1a"
      tier              = "db"
    }
    "db-b" = {
      cidr_block        = "10.0.22.0/24"
      availability_zone = "ap-southeast-1b"
      tier              = "db"
    }
  }
}

module "networking" {
  source = "../../modules/networking"

  project_name = var.project_name
  vpc_cidr     = "10.0.0.0/16"
  subnets      = local.subnets
}

module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
  backend_port = var.backend_port
}

module "database" {
  source = "../../modules/database"

  project_name          = var.project_name
  db_subnet_ids         = module.networking.db_subnet_ids
  rds_security_group_id = module.security.rds_security_group_id
  instance_class        = var.db_instance_class
  deletion_protection   = var.db_deletion_protection
  skip_final_snapshot   = var.db_skip_final_snapshot
}

module "alb" {
  source = "../../modules/alb"

  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id
  backend_port          = var.backend_port
  certificate_arn       = var.api_certificate_arn
}

module "ecs" {
  source = "../../modules/ecs"

  project_name          = var.project_name
  app_subnet_ids        = module.networking.app_subnet_ids
  ecs_security_group_id = module.security.ecs_security_group_id
  backend_port          = var.backend_port
  target_group_arn      = module.alb.target_group_arn
  container_image       = var.container_image
  desired_count         = var.desired_count
  task_cpu              = var.task_cpu
  task_memory           = var.task_memory
  db_host               = module.database.address
  db_name               = module.database.db_name
  db_username           = module.database.username
  db_master_secret_arn  = module.database.master_secret_arn
  # Ensure ALB Listener has attached TG before ECS Service registration.
  depends_on = [module.alb]
}

module "frontend" {
  source = "../../modules/frontend"

  project_name = var.project_name
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_name     = var.project_name
  alert_email      = var.alert_email
  alb_arn_suffix   = module.alb.alb_arn_suffix
  ecs_cluster_name = module.ecs.cluster_name
  ecs_service_name = module.ecs.service_name
  db_identifier    = module.database.identifier
}
