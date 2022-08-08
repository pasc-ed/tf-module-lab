variable "vpc_id" {
  description = "The VPC ID to use in this module"
}

variable "subnet_cidr" {
  description = "The CIDR of the subnet"
}

variable "subnet_name" {
  description = "The Tag Name of the subnet"
}

variable "is_public" {
  default     = false
  description = "True or False if this subnet is a public subnet"
}