terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 6.70" }
  }
}
# ALB certificate must be in the SAME Region as the ALB.
provider "aws" { region = "ap-southeast-1" }
