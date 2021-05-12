data "aws_availability_zones" "available" {
    state = "available"
}

module "vpc" {
  source                           = "terraform-aws-modules/vpc/aws"
  version                          = "2.64.0"
  name                             = "${var.namespace}-vpc"
  cidr                             = "10.0.0.0/16"
  azs                              = data.aws_availability_zones.available.names
  enable_dns_hostnames             = true
  private_subnets                  = var.private_subnets
  public_subnets                   = var.public_subnets
  enable_nat_gateway               = var.enable_nat_gw
  single_nat_gateway               = var.single_nat_gw
  tags                             = var.tags
}