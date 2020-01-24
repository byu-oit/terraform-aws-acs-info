
variable "env" {
  type        = string
  description = "Account environment (e.g. dev, prd)"
}

variable "dept_abbr" {
  type = string
  default = "oit"
  description = "Abbreviation of the department type of account (e.g. oit, trn), defaults to oit."
}

variable "vpc_vpn_to_campus" {
  type        = bool
  default     = false
  description = "Retrieve VPC info for the VPC that has VPN access to campus (defaults to false)."
}
