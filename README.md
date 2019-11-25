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
  value = module.acs.vpc_id
}

output "permission_boundary" {
  value = module.acs.role_permission_boundary_arn
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
| power_user_role_arn | The ARN of the IAM PowerUser Role |
| power_user_role_name | The name of the IAM PowerUser Role |
| power_builder_role_arn | The ARN of the IAM PowerBuilder Role |
| power_builder_role_name | The name of the IAM PowerBuilder Role |
| role_permission_boundary_arn | The ARN of the IAM role permission boundary |
| user_permission_boundary_arn | The ARN of the IAM user permission boundary |
| vpc_id | The VPC ID |
| vpc_arn | The ARN of the specified VPC |
| vpc_name | The name of the specified VPC |
| vpc_cidr_block | The CIDR block for the specified VPC |
| private_subnet_ids | List of subnet_ids for the private subnets in the specified VPC |
| public_subnet_ids | List of subnet_ids for the public subnets in the specified VPC |
| data_subnet_ids | List of subnet_ids for the data subnets in the specified VPC |
| route53_zone_name | The zone name of the default account Route53 zone |
| route53_zone_id | The ID of the default account Route53 zone |
| certificate_arn | the ARN of the default zone's ACM certificate |
| certificate_id | the ID of the default zone's ACM certificate |
