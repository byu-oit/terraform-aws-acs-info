# ACS-Info
This module retrieves some basic [ACS](https://github.com/byu-oit/aws-acs) information and exposes them via outputs. 

**Note:** This modules does not create nor update any resources.

## Usage
```hcl
module "acs" {
  source = "github.com/byu-oit/terraform-aws-existing-vpc"
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
| env | Environment of the AWS Account [dev, prd]|  |

### env
`env` is the environment of the AWS account.`dev` for dev accounts and `prd` for production accounts.

## Output
| Name | Description |
| --- | --- |
| power_user_role | The IAM PowerUser Role [object](https://www.terraform.io/docs/providers/aws/d/iam_role.html#attributes-reference) |
| power_builder_role | The IAM PowerBuilder Role [object](https://www.terraform.io/docs/providers/aws/d/iam_role.html#attributes-reference) |
| role_permissions_boundary | The IAM role permission boundary policy [object](https://www.terraform.io/docs/providers/aws/d/iam_policy.html#attributes-reference) |
| user_permissions_boundary | The IAM user permission boundary policy [object](https://www.terraform.io/docs/providers/aws/d/iam_policy.html#attributes-reference) |
| vpc | The VPC [object](https://www.terraform.io/docs/providers/aws/d/vpc.html#attributes-reference) |
| private_subnet_ids | List of subnet_ids for the private subnets in the specified VPC |
| public_subnet_ids | List of subnet_ids for the public subnets in the specified VPC |
| data_subnet_ids | List of subnet_ids for the data subnets in the specified VPC |
| route53_zone | The Route53 zone [object](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#attributes-reference) |
| certificate | The default zone's ACM certificate [object](https://www.terraform.io/docs/providers/aws/d/acm_certificate.html#attributes-reference) |
