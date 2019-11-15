# Existing VPC Module
This module retrieves some VPC and Subnet information and exposes them via outputs. 

**Note:** This modules does not create nor update any resources.

## Usage
```hcl
module "vpc" {
  source = "../"
  vpc_name = "oit-oregon-dev"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
```

## Input
| Name | Description | Default Value |
| --- | --- | --- |
| vpc_name | VPC name |  |

### vpc_name
`vpc_name` follows this convention: `(vpn-)oit-<region_name>-<environment>`.
* Where if you need access to the VPN VPC, then you add the `vpn-` prefix.
* `<region_name>` is `oregon` if you're in the us-west-2 region or `virginia` for us-east-1
* `<environment>` is `dev` for dev accounts and `prd` for production accounts

Example `vpc_name`s: `oit-oregon-prd` or `vpn-oit-virginia-dev` 

## Output
| Name | Description |
| --- | --- |
| vpc_id | The VPC ID |
| vpc_arn | The ARN of the specified VPC |
| vpc_cidr_block | The CIDR block for the specified VPC |
| private_subnet_ids | List of subnet_ids for the private subnets in the specified VPC |
| public_subnet_ids | List of subnet_ids for the public subnets in the specified VPC |
| data_subnet_ids | List of subnet_ids for the data subnets in the specified VPC |