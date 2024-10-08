terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = ">= 4.2"
  }
}

data "aws_region" "current" {}
data "aws_iam_account_alias" "current" {}

data "aws_ssm_parameter" "acs_parameters" {
  name = "acsParameters"
}

locals {
  vpc_name  = var.vpc_vpn_to_campus ? lookup(local.acs_info, "/acs/vpc/vpn-vpc-name") : lookup(local.acs_info, "/acs/vpc/vpc-name")
  sg_suffix = var.vpc_vpn_to_campus ? "_vpn_sg" : "_sg"

  acs_info = jsondecode(data.aws_ssm_parameter.acs_parameters.value)

  role_permission_boundary_arn    = lookup(local.acs_info, "/acs/iam/iamRolePermissionBoundary", null)
  user_permission_boundary_arn    = lookup(local.acs_info, "/acs/iam/iamUserPermissionBoundary", null)
  private_a_subnet_id             = lookup(local.acs_info, "/acs/vpc/${local.vpc_name}-private-a", null)
  private_b_subnet_id             = lookup(local.acs_info, "/acs/vpc/${local.vpc_name}-private-b", null)
  data_a_subnet_id                = lookup(local.acs_info, "/acs/vpc/${local.vpc_name}-data-a", null)
  data_b_subnet_id                = lookup(local.acs_info, "/acs/vpc/${local.vpc_name}-data-b", null)
  public_a_subnet_id              = lookup(local.acs_info, "/acs/vpc/${local.vpc_name}-public-a", null)
  public_b_subnet_id              = lookup(local.acs_info, "/acs/vpc/${local.vpc_name}-public-b", null)
  zone_id                         = lookup(local.acs_info, "/acs/dns/zone-id", null)
  oracle_security_group_id        = lookup(local.acs_info, "/acs/vpc/xinetd-sg-id", null)
  alation_security_group_id       = lookup(local.acs_info, "/acs/vpc/alation${local.sg_suffix}", null)
  dremio_security_group_id        = lookup(local.acs_info, "/acs/vpc/dremio${local.sg_suffix}", null)
  globalprotect_security_group_id = lookup(local.acs_info, "/acs/vpc/globalprotect${local.sg_suffix}", null)
  informatica_security_group_id   = lookup(local.acs_info, "/acs/vpc/informatica${local.sg_suffix}", null)
  tyk_security_group_id           = lookup(local.acs_info, "/acs/vpc/ty${local.sg_suffix}", null)
  github_oidc_arn                 = lookup(local.acs_info, "/acs/git/oidc-arn", null)
  github_token                    = lookup(local.acs_info, "/acs/git/token", null)
  humio_dev_token                 = lookup(local.acs_info, "/acs/humio/dev/token", null)
  humio_prd_token                 = lookup(local.acs_info, "/acs/humio/prd/token", null)
  humio_dev_endpoint              = lookup(local.acs_info, "/acs/humio/dev/endpoint", null)
  humio_prd_endpoint              = lookup(local.acs_info, "/acs/humio/prd/endpoint", null)
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
data "aws_iam_policy" "power_builder" {
  name = "PowerBuilderPolicy"
}
data "aws_iam_policy" "power" {
  name = "PowerPolicy"
}
data "aws_iam_policy" "role_permission_boundary" {
  count = local.role_permission_boundary_arn != null ? 1 : 0
  arn   = local.role_permission_boundary_arn
}
data "aws_iam_policy" "user_permission_boundary" {
  count = local.user_permission_boundary_arn != null ? 1 : 0
  arn   = local.user_permission_boundary_arn
}
data "aws_iam_openid_connect_provider" "github_actions" {
  count = local.github_oidc_arn != null ? 1 : 0
  arn   = local.github_oidc_arn
}

// VPC info
data "aws_vpc" "vpc" {
  tags = {
    Name : local.vpc_name
  }
}

data "aws_subnet" "private_a" {
  count = local.private_a_subnet_id != null ? 1 : 0
  id    = local.private_a_subnet_id
}
data "aws_subnet" "private_b" {
  count = local.private_b_subnet_id != null ? 1 : 0
  id    = local.private_b_subnet_id
}
data "aws_subnet" "data_a" {
  count = local.data_a_subnet_id != null ? 1 : 0
  id    = local.data_a_subnet_id
}
data "aws_subnet" "data_b" {
  count = local.data_b_subnet_id != null ? 1 : 0
  id    = local.data_b_subnet_id
}
data "aws_subnet" "public_a" {
  count = local.public_a_subnet_id != null ? 1 : 0
  id    = local.public_a_subnet_id
}
data "aws_subnet" "public_b" {
  count = local.public_b_subnet_id != null ? 1 : 0
  id    = local.public_b_subnet_id
}

// DNS info
data "aws_route53_zone" "zone" {
  count   = local.zone_id != null ? 1 : 0
  zone_id = local.zone_id
}
data "aws_acm_certificate" "cert" {
  count = local.zone_id != null ? 1 : 0
  // route53 zone includes a "." at the end of the zone name and the certificate can only be retrieved without the "."
  domain = trim(data.aws_route53_zone.zone[0].name, ".")
}
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
data "aws_acm_certificate" "virginia" {
  count    = local.zone_id != null ? 1 : 0
  provider = aws.virginia
  // route53 zone includes a "." at the end of the zone name and the certificate can only be retrieved without the "."
  domain = trim(data.aws_route53_zone.zone[0].name, ".")
}

// RDS info
data "aws_db_subnet_group" "db_subnet_group" {
  name = "${local.vpc_name}-db-subnet-group"
}

// Security Group info
data "aws_security_group" "ssh_rdp" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "group-name"
    values = ["*ssh_rdp*"]
  }
}

data "aws_security_group" "oracle" {
  count = local.oracle_security_group_id != null ? 1 : 0
  id    = local.oracle_security_group_id
}

data "aws_security_group" "alation" {
  count = local.alation_security_group_id != null ? 1 : 0
  id    = local.alation_security_group_id
}

data "aws_security_group" "dremio" {
  count = local.dremio_security_group_id != null ? 1 : 0
  id    = local.dremio_security_group_id
}

data "aws_security_group" "globalprotect" {
  count = local.globalprotect_security_group_id != null ? 1 : 0
  id    = local.globalprotect_security_group_id
}

data "aws_security_group" "informatica" {
  count = local.informatica_security_group_id != null ? 1 : 0
  id    = local.informatica_security_group_id
}

data "aws_security_group" "tyk" {
  count = local.tyk_security_group_id != null ? 1 : 0
  id    = local.tyk_security_group_id
}
