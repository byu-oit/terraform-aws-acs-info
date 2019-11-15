
output "vpc_id" {
  value = data.aws_vpc.vpc.id
}
output "vpc_arn" {
  value = data.aws_vpc.vpc.arn
}
output "vpc_cidr_block" {
  value = data.aws_vpc.vpc.cidr_block
}

output "private_subnet_ids" {
  value = [data.aws_subnet.private_a.id, data.aws_subnet.private_b.id]
}
output "public_subnet_ids" {
  value = [data.aws_subnet.public_a.id, data.aws_subnet.public_b.id]
}
output "data_subnet_ids" {
  value = [data.aws_subnet.data_a.id, data.aws_subnet.data_b.id]
}
