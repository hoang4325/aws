module "networking" {
  source = "../../modules/networking"

  vpc_cidr     = "10.0.0.0/16"
  project_name = "aws-ecommerce-dev"

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

module "security" {
  source = "../../modules/security"

  vpc_id       = module.networking.vpc_id
  project_name = "aws-ecommerce-dev"
  backend_port = 3000
}

module "alb" {
  source = "../../modules/alb"

  project_name          = "aws-ecommerce-dev"
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id

  backend_port    = 3000
  certificate_arn = module.acm.certificate_arn
}

module "acm" {
  source = "../../modules/acm"

  api_domain     = var.api_domain
  hosted_zone_id = var.hosted_zone_id
}

module "ecs" {
  source = "../../modules/ecs"

  project_name          = "aws-ecommerce-dev"
  backend_port          = 3000
  app_subnet_ids        = module.networking.app_subnet_ids
  ecs_security_group_id = module.security.ecs_security_group_id
  target_group_arn      = module.alb.target_group_arn
  depends_on            = [module.alb]
}