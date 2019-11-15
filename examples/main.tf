provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "../"
  vpc_name = "oit-oregon-dev"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}