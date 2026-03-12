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


variable "subnetprivate1_id" {
  type        = string
  description = "private1 subnet id from the vpc module"
}

variable "subnetprivate2_id" {
  type        = string
  description = "private2 subnet id from the vpc module"
}

variable "vpc_id" {
  type        = string
  description = "vpc id from the vpc module"
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

