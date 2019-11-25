provider "aws" {
  region = "us-west-2"
}

module "acs" {
  source = "../"
  env = "dev"
}

output "vpc_id" {
  value = module.acs.vpc.id
}

output "private_subnets" {
  value = module.acs.private_subnet_ids
}

output "power_builder_role_arn" {
  value = module.acs.power_builder_role.arn
}

output "permission_boundary" {
  value = module.acs.role_permission_boundary.arn
}

output "route53_zone_name" {
  value = module.acs.route53_zone.name
}

output "cert_id" {
  value = module.acs.certificate.id
}
output "cert_arn" {
  value = module.acs.certificate.arn
}