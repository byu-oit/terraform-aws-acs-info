terraform {
  required_version = "0.13.2"
}

provider "aws" {
  version = ">= 3.0"
  region  = "us-west-2"
}

module "acs" {
  source = "../../"
}

output "power_user_role" {
  value = module.acs.power_user_role
}
output "power_builder_role" {
  value = module.acs.power_builder_role
}
output "role_permissions_boundary" {
  value = module.acs.role_permissions_boundary
}
output "user_permissions_boundary" {
  value = module.acs.user_permissions_boundary
}
output "vpc" {
  value = module.acs.vpc
}
output "private_subnet_ids" {
  value = module.acs.private_subnet_ids
}
output "public_subnet_ids" {
  value = module.acs.public_subnet_ids
}
output "data_subnet_ids" {
  value = module.acs.data_subnet_ids
}
output "private_subnets" {
  value = module.acs.private_subnets
}
output "public_subnets" {
  value = module.acs.public_subnets
}
output "data_subnets" {
  value = module.acs.data_subnets
}
output "route53_zone" {
  value = module.acs.route53_zone
}
output "certificate" {
  value = module.acs.certificate
}
output "certificate_virginia" {
  value = module.acs.certificate_virginia
}
output "db_subnet_group_name" {
  value = module.acs.db_subnet_group_name
}
output "db_subnet_group" {
  value = module.acs.db_subnet_group
}
output "elasticache_subnet_group_name" {
  value = module.acs.elasticache_subnet_group_name
}
output "ssh_rdp_security_group" {
  value = module.acs.ssh_rdp_security_group
}
output "oracle_security_group" {
  value = module.acs.oracle_security_group
}
output "github_token" {
  value = module.acs.github_token
}
output "humio_dev_token" {
  value = module.acs.humio_dev_token
}
output "humio_prd_token" {
  value = module.acs.humio_prd_token
}
output "humio_dev_endpoint" {
  value = module.acs.humio_dev_endpoint
}
output "humio_prd_endpoint" {
  value = module.acs.humio_prd_endpoint
}
