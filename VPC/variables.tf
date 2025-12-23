variable "vpc_cidr" {}
variable "public_subnets" {
  type = map(object({
    cidr = string
    az = string
  }))
}
variable "private_subnets" {
  type = map(object({
    cidr = string
    az = string
  }))
}
variable "tags" {
  description = "Common tags for all VPC resources"
  type        = map(string)
  default     = {}
}
