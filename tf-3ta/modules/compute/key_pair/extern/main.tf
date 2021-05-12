

module "key_pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  version    = "1.0.0"

  key_name   = var.key_name
  public_key = file(var.pub_key_path)
  tags       = var.tags
}