provider "aws" {
  region = "us-west-2"
}

module "acs" {
  source = "github.com/byu-oit/terraform-aws-acs-info?ref=v4.1.0"
}

output "vpc_id" {
  value = module.acs.vpc.id
}

output "private_subnets" {
  value     = module.acs.private_subnet_ids
  sensitive = true
}

output "power_builder_role_arn" {
  value = module.acs.power_builder_role.arn
}

output "power_builder_policy_arns" {
  value = module.acs.power_builder_policies[*].arn
}

output "permission_boundary" {
  value     = module.acs.role_permissions_boundary.arn
  sensitive = true
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

output "github_oidc_arn" {
  value     = module.acs.github_oidc_provider.arn
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
