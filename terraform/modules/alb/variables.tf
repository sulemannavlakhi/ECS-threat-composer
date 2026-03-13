variable "vpc_id" {
  type        = string
  description = "VPC id from vpc module"
}

variable "subnet_public2_id" {
  type        = string
  description = "public 2 subnet id from vpc module"
}

variable "application_port" {
  type        = number
  description = "the port for application"
}

variable "subnet_public1_id" {
  type        = string
  description = "public 1 subnet id from vpc module"
}

variable "ingress_cidr" {
  type        = string
  description = "ingress cidr"
}

variable "egress_cidr" {
  type        = string
  description = "egress cidr"
}

variable "certificate_arn" {
  type = string
  description = "acm certificate arn"
}