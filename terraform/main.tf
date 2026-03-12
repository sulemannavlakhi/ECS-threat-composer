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