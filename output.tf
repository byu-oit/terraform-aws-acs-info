// IAM outputs
output "power_user_role" {
  value = data.aws_iam_role.power_user
}
output "power_builder_role" {
  value = data.aws_iam_role.power_builder
}
output "role_permissions_boundary" {
  value = local.role_permission_boundary_arn != null ? data.aws_iam_policy.role_permission_boundary[0] : null
}
output "user_permissions_boundary" {
  value = local.user_permission_boundary_arn != null ? data.aws_iam_policy.user_permission_boundary[0] : null
}

// VPC outputs
output "vpc" {
  value = data.aws_vpc.vpc
}
output "private_subnet_ids" {
  value = local.private_a_subnet_id != null ? [data.aws_subnet.private_a[0].id, data.aws_subnet.private_b[0].id] : null
}
output "public_subnet_ids" {
  value = local.public_a_subnet_id != null ? [data.aws_subnet.public_a[0].id, data.aws_subnet.public_b[0].id] : null
}
output "data_subnet_ids" {
  value = local.data_a_subnet_id != null ? [data.aws_subnet.data_a[0].id, data.aws_subnet.data_b[0].id] : null
}
output "private_subnets" {
  value = local.private_a_subnet_id != null ? [data.aws_subnet.private_a[0], data.aws_subnet.private_b[0]] : null
}
output "public_subnets" {
  value = local.public_a_subnet_id != null ? [data.aws_subnet.public_a[0], data.aws_subnet.public_b[0]] : null
}
output "data_subnets" {
  value = local.data_a_subnet_id != null ? [data.aws_subnet.data_a[0], data.aws_subnet.data_b[0]] : null
}

// DNS outputs
output "route53_zone" {
  value = local.zone_id != null ? data.aws_route53_zone.zone[0] : null
}
output "certificate" {
  value = local.zone_id != null ? data.aws_acm_certificate.cert[0] : null
}
output "certificate_virginia" {
  value = local.zone_id != null ? data.aws_acm_certificate.virginia[0] : null
}

// RDS outputs
output "db_subnet_group_name" {
  // Terraform didn't used to have a data accessor for this, so the best we could do was return the name
  // Keeping for backwards compatibility
  value = data.aws_db_subnet_group.db_subnet_group.name
}

output "db_subnet_group" {
  value = data.aws_db_subnet_group.db_subnet_group
}

//Elasticache outputs
output "elasticache_subnet_group_name" {
  // Terraform doesn't have a data accessor for this, so the best we can do is return the name
  value = "${local.vpc_name}-elasticache-subnet-group"
}

// Security Group outputs
output "ssh_rdp_security_group" {
  value = data.aws_security_group.ssh_rdp
}

output "oracle_security_group" {
  value = local.oracle_security_group_id != null ? data.aws_security_group.oracle[0] : null
}

// Integration token outputs
output "github_token" {
  value = local.github_token # there's no data source, so no need for the null check
}

output "humio_dev_token" {
  value = local.humio_dev_token # there's no data source, so no need for the null check
}

output "humio_prd_token" {
  value = local.humio_prd_token # there's no data source, so no need for the null check
}

output "humio_dev_endpoint" {
  value = local.humio_dev_endpoint # there's no data source, so no need for the null check
}

output "humio_prd_endpoint" {
  value = local.humio_prd_endpoint # there's no data source, so no need for the null check
}

