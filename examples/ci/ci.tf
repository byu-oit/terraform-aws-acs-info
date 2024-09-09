terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "acs" {
  source = "../../"
}

output "power_user_role" {
  value     = module.acs.power_user_role
  sensitive = true
}
output "power_builder_role" {
  value     = module.acs.power_builder_role
  sensitive = true
}
output "power_builder_policies" {
  value     = module.acs.power_builder_policies
  sensitive = true
}
output "role_permissions_boundary" {
  value     = module.acs.role_permissions_boundary
  sensitive = true
}
output "user_permissions_boundary" {
  value     = module.acs.user_permissions_boundary
  sensitive = true
}
output "vpc" {
  value     = module.acs.vpc
  sensitive = true
}
output "private_subnet_ids" {
  value     = module.acs.private_subnet_ids
  sensitive = true
}
output "public_subnet_ids" {
  value     = module.acs.public_subnet_ids
  sensitive = true
}
output "data_subnet_ids" {
  value     = module.acs.data_subnet_ids
  sensitive = true
}
output "private_subnets" {
  value     = module.acs.private_subnets
  sensitive = true
}
output "public_subnets" {
  value     = module.acs.public_subnets
  sensitive = true
}
output "data_subnets" {
  value     = module.acs.data_subnets
  sensitive = true
}
output "route53_zone" {
  value     = module.acs.route53_zone
  sensitive = true
}
output "certificate" {
  value     = module.acs.certificate
  sensitive = true
}
output "certificate_virginia" {
  value     = module.acs.certificate_virginia
  sensitive = true
}
output "db_subnet_group_name" {
  value     = module.acs.db_subnet_group_name
  sensitive = true
}
output "db_subnet_group" {
  value     = module.acs.db_subnet_group
  sensitive = true
}
output "elasticache_subnet_group_name" {
  value     = module.acs.elasticache_subnet_group_name
  sensitive = true
}
output "ssh_rdp_security_group" {
  value     = module.acs.ssh_rdp_security_group
  sensitive = true
}
output "oracle_security_group" {
  value     = module.acs.oracle_security_group
  sensitive = true
}
output "alation_security_group" {
  value     = module.acs.alation_security_group
  sensitive = true
}
output "dremio_security_group" {
  value     = module.acs.dremio_security_group
  sensitive = true
}
output "globalprotect_security_group" {
  value     = module.acs.globalprotect_security_group
  sensitive = true
}
output "informatica_security_group" {
  value     = module.acs.informatica_security_group
  sensitive = true
}
output "tyk_security_group" {
  value     = module.acs.tyk_security_group
  sensitive = true
}
output "github_oidc_provider" {
  value     = module.acs.github_oidc_provider
  sensitive = true
}
output "github_token" {
  value     = module.acs.github_token
  sensitive = true
}
output "humio_dev_token" {
  value     = module.acs.humio_dev_token
  sensitive = true
}
output "humio_prd_token" {
  value     = module.acs.humio_prd_token
  sensitive = true
}
output "humio_dev_endpoint" {
  value     = module.acs.humio_dev_endpoint
  sensitive = true
}
output "humio_prd_endpoint" {
  value     = module.acs.humio_prd_endpoint
  sensitive = true
}
