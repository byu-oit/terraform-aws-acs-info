// IAM outputs
output "power_user_role" {
  value = data.aws_iam_role.power_user
}
output "power_builder_role" {
  value = data.aws_iam_role.power_builder
}
output "role_permissions_boundary" {
  value = data.aws_iam_policy.role_permission_boundary
}
output "user_permissions_boundary" {
  value = data.aws_iam_policy.user_permission_boundary
}

// VPC outputs
output "vpc" {
  value = data.aws_vpc.vpc
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
output "private_subnets" {
  value = [data.aws_subnet.private_a, data.aws_subnet.private_b]
}
output "public_subnets" {
  value = [data.aws_subnet.public_a, data.aws_subnet.public_b]
}
output "data_subnets" {
  value = [data.aws_subnet.data_a, data.aws_subnet.data_b]
}

// DNS outputs
output "route53_zone" {
  value = data.aws_route53_zone.zone
}
output "certificate" {
  value = data.aws_acm_certificate.cert
}

// CodePipeline outputs
output "github_token" {
	value = data.aws_ssm_parameter.github_token.value
}
