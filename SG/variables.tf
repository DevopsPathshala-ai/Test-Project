variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
}

variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "http_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
