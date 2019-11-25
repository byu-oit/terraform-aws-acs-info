// IAM outputs
output "power_user_role" {
  value = data.aws_iam_role.power_user
}
output "power_builder_role" {
  value = data.aws_iam_role.power_builder
}
output "role_permission_boundary" {
  value = data.aws_iam_policy.role_permission_boundary
}
output "user_permission_boundary" {
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

// DNS outputs
output "route53_zone" {
  value = data.aws_route53_zone.zone
}
output "certificate" {
  value = data.aws_acm_certificate.cert
}
