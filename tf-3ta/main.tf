locals {
  namespace = "${var.project}-${var.environment}"
  vpc_name = "${local.namespace}-vpc"
  bastion_sg_name = "${local.namespace}-bastion-sg"
  bastion_host_name = "${local.namespace}-bastion-host"
  bastion_ec2_kp = "${local.namespace}-bastion-kp"
  vpc_tags = merge(var.tags, {Name=local.vpc_name, namespace=local.namespace, name=var.project, environment=var.environment})
  bastion_sg_tags = merge(var.tags, {Name=local.bastion_sg_name, namespace=local.namespace, name=var.project, environment=var.environment})
  bastion_host_tags = merge(var.tags, {Name=local.bastion_host_name, namespace=local.namespace, name=var.project, environment=var.environment})
  bastion_user_data = <<EOF
#!/bin/bash
echo "Hello Terraform!" >> /etc/motd
EOF
  bastion_host_ec2_key_pair_tags = merge(var.tags, {Name=local.bastion_ec2_kp, namespace=local.namespace, name=var.project, environment=var.environment})
}

module "project_vpc" {
  source             = "./modules/networking/vpc"
  namespace          = local.vpc_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  single_nat_gw      = var.single_nat_gw
  enable_nat_gw      = var.enable_nat_gw
  tags               = local.vpc_tags
}

module "bastion_sg" {
  source          = "./modules/networking/sg"
  vpc_id          = module.project_vpc.vpc.vpc_id
  name            = local.bastion_sg_name
  description     = var.bastion_sg_description
  tags            = local.bastion_sg_tags
  ingress_with_cidr_blocks = var.bastion_ingress_with_cidr_blocks
}

module "bastion_host_ec2_key_pair" {
  source          = "./modules/compute/key_pair/extern"
  key_name        = var.key_name
  pub_key_path    = var.pub_key_path
  tags            = local.bastion_host_ec2_key_pair_tags
}

module "bastion_host1" {
  source                 = "./modules/compute/ec2"
  name                   = local.bastion_host_name
  instance_type          = var.instance_type
  subnet_id              = module.project_vpc.vpc.public_subnets[0]
  vpc_security_group_ids = module.bastion_sg.sg.security_group_id
  user_data              = local.bastion_user_data
  tags                   = local.bastion_host_tags
  key_name               = module.bastion_host_ec2_key_pair.key_pair_key_name
}