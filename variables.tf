
//variable "vpc_name" {
//  type = string
//  default = "oit-oregon-dev"
//  description = "VPC name. [oit-oregon-dev, oit-oregon-prd, oit-oregon-dev, oit-oregon-prd, oit-virginia-dev, oit-virginia-prd, oit-virginia-dev, oit-virginia-prd]"
//}

variable "env" {
  type = string
  description = "Account environment [dev, prd]"
}

variable "vpc_vpn_to_campus" {
  type = bool
  default = false
  description = "Retrieve VPC info for the VPC that has VPN access to campus (defaults to false)."
}