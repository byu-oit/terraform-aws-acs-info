
data "aws_region" "current" {}

locals {
  vpc_name = "${var.vpc_vpn_to_campus ? "vpn-" : ""}oit-${data.aws_region.current.name == "us-west-2" ? "oregon-": "virginia-"}${var.env}"
}

// IAM parameters
data "aws_ssm_parameter" "iam_role_permission_boundary" {
  name = "/acs/iam/iamRolePermissionBoundary"
}
data "aws_ssm_parameter" "iam_user_permission_boundary" {
  name = "/acs/iam/iamUserPermissionBoundary"
}

// VPC parameters
data "aws_ssm_parameter" "subnet_private_a" {
  name = "/acs/vpc/${local.vpc_name}-private-a"
}
data "aws_ssm_parameter" "subnet_private_b" {
  name = "/acs/vpc/${local.vpc_name}-private-b"
}
data "aws_ssm_parameter" "subnet_data_a" {
  name = "/acs/vpc/${local.vpc_name}-data-a"
}
data "aws_ssm_parameter" "subnet_data_b" {
  name = "/acs/vpc/${local.vpc_name}-data-b"
}
data "aws_ssm_parameter" "subnet_public_a" {
  name = "/acs/vpc/${local.vpc_name}-public-a"
}
data "aws_ssm_parameter" "subnet_public_b" {
  name = "/acs/vpc/${local.vpc_name}-public-b"
}

// DNS parameters
data "aws_ssm_parameter" "zone_id" {
  name = "/acs/dns/zone-id"
}

// CodePipeline parameters
data "aws_ssm_parameter" "github_token" {
  name = "/acs/git/token"
}

// IAM info
data "aws_iam_role" "power_user" {
  name = "PowerUser"
}
data "aws_iam_role" "power_builder" {
  name = "PowerBuilder"
}
data "aws_iam_role" "read_only" {
  name = "ReadOnly"
}
data "aws_iam_policy" "role_permission_boundary" {
  arn = data.aws_ssm_parameter.iam_role_permission_boundary.value
}
data "aws_iam_policy" "user_permission_boundary" {
  arn = data.aws_ssm_parameter.iam_user_permission_boundary.value
}

// VPC info
data "aws_vpc" "vpc" {
  tags = {
    Name: local.vpc_name
  }
}

data "aws_subnet" "private_a" {
  id = data.aws_ssm_parameter.subnet_private_a.value
}
data "aws_subnet" "private_b" {
  id = data.aws_ssm_parameter.subnet_private_b.value
}
data "aws_subnet" "data_a" {
  id = data.aws_ssm_parameter.subnet_data_a.value
}
data "aws_subnet" "data_b" {
  id = data.aws_ssm_parameter.subnet_data_b.value
}
data "aws_subnet" "public_a" {
  id = data.aws_ssm_parameter.subnet_public_a.value
}
data "aws_subnet" "public_b" {
  id = data.aws_ssm_parameter.subnet_public_b.value
}

// DNS info
data "aws_route53_zone" "zone" {
  zone_id = data.aws_ssm_parameter.zone_id.value
}
data "aws_acm_certificate" "cert" {
  // route53 zone includes a "." at the end of the zone name and the certificate can only be retrieved without the "."
  // TODO the trim function would have been preferred, but is not available with terraform 0.12.16, fix will be available in 0.12.17
  domain = replace(data.aws_route53_zone.zone.name, "/\\.$/", "")
}
