module "cloudfront" {
  source = "./modules/cloudfront"
}

module "ecr" {
  source = "./modules/ecr"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_subnet = var.vpc_subnet
  vpc_route = var.vpc_route
  vpc_sg = var.vpc_sg
}

module "s3" {
  source = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
}