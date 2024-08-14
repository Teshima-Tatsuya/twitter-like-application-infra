module "cloudfront" {
  source = "./modules/cloudfront"

  s3 = module.s3.s3
  cloudfront = local.cloudfront
  vpc = module.vpc.vpc

  depends_on = [ 
    module.ecs
  ]
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source = "./modules/ecs"

  iam = module.iam.iam
  vpc = module.vpc.vpc
}

module "iam" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_subnet = var.vpc_subnet
  vpc_route = var.vpc_route
  vpc_sg = var.vpc_sg
}

module "rds" {
  source = "./modules/rds"

  vpc = module.vpc.vpc
}

module "route53" {
  source = "./modules/route53"

  cloudfront = module.cloudfront.cloudfront
  domain_name = local.cloudfront.domain_name
  backend_domain_name = local.cloudfront.backend_domain_name
  route53 = local.route53
}

module "s3" {
  source = "./modules/s3"
  s3_bucket_name = var.s3_bucket_name
  cloudfront = module.cloudfront.cloudfront
}

module "ssm" {
  source = "./modules/ssm"
  DB_HOST = var.DB_HOST
  DB_USERNAME = var.DB_USERNAME
  DB_PASSWORD = var.DB_PASSWORD
  SECRET_KEY_BASE = var.SECRET_KEY_BASE
}