#variables used in vpc module
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

#variables used in ecs module

variable "application_port" {
  type        = number
  description = "port for the application"
}

variable "ecs_container_name" {
  type        = string
  description = "name of the container in the task definition"
}

variable "tg_arn" {
  type        = string
  description = "target group arn from the alb module"
}

variable "ecs_docker_port" {
  type        = number
  description = "port the docker image uses"
}

variable "ecs_memory" {
  type        = number
  description = "memory value for the task definition"
}

variable "vpc_id" {
  type        = string
  description = "vpc id from the vpc module"
}

variable "subnetprivate1_id" {
  type        = string
  description = "private1 subnet id from the vpc module"
}

variable "subnetprivate2_id" {
  type        = string
  description = "private2 subnet id from the vpc module"
}

variable "ecs_image" {
  type        = string
  description = "url for the latest docker image"
}

variable "ecs_cpu" {
  type        = number
  description = "cpu value for task definition"
}

variable "ecs_desired_count" {
  type        = number
  description = "number of instances for task definition to be deployed"
}

variable "ingress_cidr" {
  type        = string
  description = "ingress cidr"
}

variable "egress_cidr" {
  type        = string
  description = "egress cidr"
}


