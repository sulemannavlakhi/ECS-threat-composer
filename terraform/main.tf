module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                               = var.vpc_cidr
  routetable_cidr                        = var.routetable_cidr
  az_1a                                  = var.az_1a
  az_2a                                  = var.az_2a
  public_subnet_1                        = var.public_subnet_1
  public_subnet_2                        = var.public_subnet_2
  public_subnet_map_public_ip_on_launch  = var.public_subnet_map_public_ip_on_launch
  private_subnet_1                       = var.private_subnet_1
  private_subnet_2                       = var.private_subnet_2
  private_subnet_map_public_ip_on_launch = var.private_subnet_map_public_ip_on_launch
}

module "ecs" {
  source = "./modules/ecs"

  vpc_id             = module.vpc.vpc_id
  subnetprivate1_id  = module.vpc.private_subnet_1_id
  subnetprivate2_id  = module.vpc.private_subnet_2_id
  tg_arn             = module.alb.target_group_arn

  application_port   = var.application_port
  ecs_container_name = var.ecs_container_name
  ecs_docker_port    = var.ecs_docker_port
  ecs_memory         = var.ecs_memory
  ecs_cpu            = var.ecs_cpu
  ecs_desired_count  = var.ecs_desired_count
  ecs_image          = var.ecs_image
}