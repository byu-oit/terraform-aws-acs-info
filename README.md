![Latest GitHub Release](https://img.shields.io/github/v/release/byu-oit/terraform-aws-acs-info?sort=semver)

# Terraform AWS ACS Info

This module retrieves some basic [ACS](https://github.com/byu-oit/aws-acs) information and exposes them via outputs. 

**Note:** This module does not create nor update any resources.

## Usage

```hcl
module "acs" {
  source = "git@github.com:byu-oit/terraform-aws-acs-info.git?ref=v1.1.0
}

output "vpc_id" {
  value = module.acs.vpc.id
}

output "permissions_boundary" {
  value = module.acs.role_permissions_boundary.arn
}
```

## Input

| Name | Description | Default Value |
| --- | --- | --- |
| env | Environment of the AWS Account (e.g. dev, prd)|  |
| vpc_vpn_to_campus | Retrieve VPC info for the VPC that has VPN access to campus | false |

## Output

| Name | Description |
| --- | --- |
| power_user_role | The IAM PowerUser Role [object](https://www.terraform.io/docs/providers/aws/d/iam_role.html#attributes-reference) |
| power_builder_role | The IAM PowerBuilder Role [object](https://www.terraform.io/docs/providers/aws/d/iam_role.html#attributes-reference) |
| role_permissions_boundary | The IAM role permissions boundary policy [object](https://www.terraform.io/docs/providers/aws/d/iam_policy.html#attributes-reference) |
| user_permissions_boundary | The IAM user permissions boundary policy [object](https://www.terraform.io/docs/providers/aws/d/iam_policy.html#attributes-reference) |
| vpc | The VPC [object](https://www.terraform.io/docs/providers/aws/d/vpc.html#attributes-reference) |
| private_subnet_ids | List of subnet_ids for the private subnets in the specified VPC |
| public_subnet_ids | List of subnet_ids for the public subnets in the specified VPC |
| data_subnet_ids | List of subnet_ids for the data subnets in the specified VPC |
| private_subnets | List of private subnet [objects](https://www.terraform.io/docs/providers/aws/r/subnet.html#attributes-reference) in the specified VPC |
| public_subnets | List of public subnet [objects](https://www.terraform.io/docs/providers/aws/r/subnet.html#attributes-reference) in the specified VPC |
| data_subnets | List of data subnet [objects](https://www.terraform.io/docs/providers/aws/r/subnet.html#attributes-reference) in the specified VPC |
| route53_zone | The Route53 zone [object](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#attributes-reference) |
| certificate | The default zone's ACM certificate [object](https://www.terraform.io/docs/providers/aws/d/acm_certificate.html#attributes-reference) |
| db_subnet_group_name | The database subnet group name for RDS in the specified VPC [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) |
| ssh_rdp_security_group | The security group to enable SSH/RDP access to resources in the specified VPC [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) |
| rds_security_group | The security group for RDS clusters and instances in the specified VPC [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) |
| oracle_security_group | The security group to enable Oracle access to resources in the specified VPC [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) |
| github_token | The token to use in CI/CD pipelines to fetch source code from GitHub |

**Note about returning objects**: Because objects are returned (as opposed to just values), autocomplete may not work. Just add on the key to the end out the output accessor. Even though autocomplete won't work, those values will still be correctly returned.

