
data "aws_region" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_ssm_parameter" "acs_parameters" {
  name = "acsParameters"
}

locals {
  vpc_name                  = "${var.vpc_vpn_to_campus ? "vpn-" : ""}oit-${data.aws_region.current.name == "us-west-2" ? "oregon-" : "virginia-"}${var.env}"
  acs_info                  = jsondecode(data.aws_ssm_parameter.acs_parameters.value)
  acs_keys                  = keys(local.acs_info)
  has_oracle_security_group = contains(local.acs_keys, "/acs/vpc/${data.aws_region.current.name}/${var.env}-xinetd-sg-id")
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
  arn = local.acs_info["/acs/iam/iamRolePermissionBoundary"]
}
data "aws_iam_policy" "user_permission_boundary" {
  arn = local.acs_info["/acs/iam/iamUserPermissionBoundary"]
}

// VPC info
data "aws_vpc" "vpc" {
  tags = {
    Name : local.vpc_name
  }
}

data "aws_subnet" "private_a" {
  id = local.acs_info["/acs/vpc/${local.vpc_name}-private-a"]
}
data "aws_subnet" "private_b" {
  id = local.acs_info["/acs/vpc/${local.vpc_name}-private-b"]
}
data "aws_subnet" "data_a" {
  id = local.acs_info["/acs/vpc/${local.vpc_name}-data-a"]
}
data "aws_subnet" "data_b" {
  id = local.acs_info["/acs/vpc/${local.vpc_name}-data-b"]
}
data "aws_subnet" "public_a" {
  id = local.acs_info["/acs/vpc/${local.vpc_name}-public-a"]
}
data "aws_subnet" "public_b" {
  id = local.acs_info["/acs/vpc/${local.vpc_name}-public-b"]
}

// DNS info
data "aws_route53_zone" "zone" {
  zone_id = local.acs_info["/acs/dns/zone-id"]
}
data "aws_acm_certificate" "cert" {
  // route53 zone includes a "." at the end of the zone name and the certificate can only be retrieved without the "."
  // TODO the trim function would have been preferred, but is not available with terraform 0.12.16, fix will be available in 0.12.17
  domain = replace(data.aws_route53_zone.zone.name, "/\\.$/", "")
}

// Security Group info
data "aws_security_group" "ssh_rdp" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "group-name"
    values = ["*ssh*"]
  }
}

data "aws_security_group" "rds" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "group-name"
    values = ["*rds*"]
  }
}

data "aws_security_group" "oracle" {
  count = local.has_oracle_security_group ? 1 : 0
  id    = local.acs_info["/acs/vpc/${data.aws_region.current.name}/${var.env}-xinetd-sg-id"]
}
