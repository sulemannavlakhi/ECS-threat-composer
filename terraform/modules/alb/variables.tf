variable "vpc_id" {
  type        = string
  description = "VPC id from vpc module"
}

variable "subnetpublic2_id" {
  type        = string
  description = "public 2 subnet id from vpc module"
}

variable "application-port" {
  type        = number
  description = "the port for application"
}

variable "subnetpublic1_id" {
  type        = string
  description = "public 1 subnet id from vpc module"
}

variable "cert_arn" {
  type        = string
  description = "certificate arn from route53 module"
}
