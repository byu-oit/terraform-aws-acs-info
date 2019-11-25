// IAM outputs
output "power_user_role_arn" {
  value = data.aws_iam_role.power_user.arn
}
output "power_user_role_name" {
  value = data.aws_iam_role.power_user.name
}
output "power_builder_role_arn" {
  value = data.aws_iam_role.power_builder.arn
}
output "power_builder_role_name" {
  value = data.aws_iam_role.power_builder.name
}
output "role_permission_boundary_arn" {
  value = data.aws_iam_policy.role_permission_boundary.arn
}
output "user_permission_boundary_arn" {
  value = data.aws_iam_policy.user_permission_boundary.arn
}

// VPC outputs
output "vpc_id" {
  value = data.aws_vpc.vpc.id
}
output "vpc_arn" {
  value = data.aws_vpc.vpc.arn
}
output "vpc_name" {
  value = local.vpc_name
}
output "vpc_cidr_block" {
  value = data.aws_vpc.vpc.cidr_block
}
output "private_subnet_ids" {
  value = [data.aws_subnet.private_a.id, data.aws_subnet.private_b.id]
}
output "public_subnet_ids" {
  value = [data.aws_subnet.public_a.id, data.aws_subnet.public_b.id]
}
output "data_subnet_ids" {
  value = [data.aws_subnet.data_a.id, data.aws_subnet.data_b.id]
}

// DNS outputs
output "route53_zone_name" {
  value = data.aws_route53_zone.zone.name
}
output "route53_zone_id" {
  value = data.aws_route53_zone.zone.zone_id
}
output "certificate_arn" {
  value = data.aws_ssm_parameter.cert_arn.value
}
output "certificate_id" {
  value = data.aws_ssm_parameter.zone_id.value
}
