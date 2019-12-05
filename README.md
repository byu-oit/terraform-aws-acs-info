# Terraform AWS ACS Info
This module retrieves some basic [ACS](https://github.com/byu-oit/aws-acs) information and exposes them via outputs. 

**Note:** This module does not create nor update any resources.

## Usage
```hcl
module "acs" {
  source = "github.com/byu-oit/terraform-aws-acs-info"
  env = "dev"
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

**Note about returning objects**: Because objects are returned (as opposed to just values), autocomplete may not work. Just add on the key to the end out the output accessor. Even though autocomplete won't work, those values will still be correctly returned.
