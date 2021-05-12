module "sg" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "4.0.0"

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_rules        = ["all-all"]
}