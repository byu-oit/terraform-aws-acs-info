![Latest GitHub Release](https://img.shields.io/github/v/release/byu-oit/terraform-aws-acs-info?sort=semver)

# Terraform AWS ACS Info

This module retrieves some basic [ACS](https://github.com/byu-oit/aws-acs) information and exposes them via outputs. 

**Note:** This module does not create nor update any resources.

## Usage

```hcl
module "acs" {
  source = "github.com/byu-oit/terraform-aws-acs-info.git?ref=v2.2.0"
}
```
After defining the module you can then retrieve the information you need (see available [outputs](#output) below) using the interpolation syntax:
```hcl
...
  vpc_id = module.acs.vpc.id

```

## Requirements
* Terraform version 0.12.17 or greater

## Input

| Name | Type | Description | Default Value |
| --- | --- | --- | --- |
| vpc_vpn_to_campus | bool | Retrieve VPC info for the VPC that has VPN access to campus | false |

## Output

| Name | Type |Description |
| --- | --- | --- |
| power_user_role | [object](https://www.terraform.io/docs/providers/aws/d/iam_role.html#attributes-reference) | The IAM PowerUser Role object |
| power_builder_role | [object](https://www.terraform.io/docs/providers/aws/d/iam_role.html#attributes-reference) | The IAM PowerBuilder Role object |
| role_permissions_boundary | [object](https://www.terraform.io/docs/providers/aws/d/iam_policy.html#attributes-reference) | The IAM role permissions boundary policy object |
| user_permissions_boundary | [object](https://www.terraform.io/docs/providers/aws/d/iam_policy.html#attributes-reference) | The IAM user permissions boundary policy object |
| vpc | [object](https://www.terraform.io/docs/providers/aws/d/vpc.html#attributes-reference) | The VPC object |
| private_subnet_ids | list(string) | List of subnet_ids for the private subnets in the specified VPC |
| public_subnet_ids | list(string) | List of subnet_ids for the public subnets in the specified VPC |
| data_subnet_ids | list(string) | List of subnet_ids for the data subnets in the specified VPC |
| private_subnets | list([object](https://www.terraform.io/docs/providers/aws/r/subnet.html#attributes-reference)) | List of private subnet objects in the specified VPC |
| public_subnets | list([object](https://www.terraform.io/docs/providers/aws/r/subnet.html#attributes-reference)) | List of public subnet object in the specified VPC |
| data_subnets | list([object](https://www.terraform.io/docs/providers/aws/r/subnet.html#attributes-reference)) | List of data subnet objects in the specified VPC |
| route53_zone | [object](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#attributes-reference) | The Route53 zone object |
| certificate | [object](https://www.terraform.io/docs/providers/aws/d/acm_certificate.html#attributes-reference) | The default zone's ACM certificate object) |
| certificate_virginia | [object](https://www.terraform.io/docs/providers/aws/d/acm_certificate.html#attributes-reference) | The default zone's ACM certificate for us-east-1 (needed by CloudFront, API Gateway, etc.) object |
| db_subnet_group_name | [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) | The database subnet group name for RDS in the specified VPC object |
| ssh_rdp_security_group | [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) | The security group to enable SSH/RDP access to resources in the specified VPC object |
| oracle_security_group | [object](https://www.terraform.io/docs/providers/aws/d/security_group.html) | The security group to enable Oracle access to resources in the specified VPC object |
| github_token | string | The token to use in CI/CD pipelines to fetch source code from GitHub (this if only available in certain AWS accounts) |

**Note about returning objects**: Because objects are returned (as opposed to just values), autocomplete may not work. Just add on the key to the end out the output accessor. Even though autocomplete won't work, those values will still be correctly returned.

## Developing

### Release new version

To release a new version, update the examples in the `examples` folder, the example in this README, and the number in the version file. Pushing to `master` will automatically create a new release and tag in GitHub.
