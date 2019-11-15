
data "aws_vpc" "vpc" {
  tags = {
    Name: var.vpc_name
  }
}

data "aws_ssm_parameter" "subnet_private_a" {
  name = "/acs/vpc/${var.vpc_name}-private-a"
}
data "aws_ssm_parameter" "subnet_private_b" {
  name = "/acs/vpc/${var.vpc_name}-private-b"
}
data "aws_ssm_parameter" "subnet_data_a" {
  name = "/acs/vpc/${var.vpc_name}-data-a"
}
data "aws_ssm_parameter" "subnet_data_b" {
  name = "/acs/vpc/${var.vpc_name}-data-b"
}
data "aws_ssm_parameter" "subnet_public_a" {
  name = "/acs/vpc/${var.vpc_name}-public-a"
}
data "aws_ssm_parameter" "subnet_public_b" {
  name = "/acs/vpc/${var.vpc_name}-public-b"
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