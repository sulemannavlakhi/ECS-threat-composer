variable "routetable_cidr" {
  type        = string
  description = "route table CIDR"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnet_1" {
  type        = string
  description = "public subnet 1 CIDR"
}

variable "public_subnet_2" {
  type        = string
  description = "public subnet 2 CIDR"
}

variable "public_subnet_map_public_ip_on_launch" {
  type        = bool
  description = "map public ip on launch"
}

variable "private_subnet_map_public_ip_on_launch" {
  type        = bool
  description = "map private ip on launch"
}

variable "private_subnet_1" {
  type        = string
  description = "private subnet 1 CIDR"
}

variable "private_subnet_2" {
  type        = string
  description = "private subnet 2 CIDR"
}