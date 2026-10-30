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

# module "alb" {
#   source = "../../modules/alb"

#   public_subnet_ids = module.networking.public_subnet_ids
# }