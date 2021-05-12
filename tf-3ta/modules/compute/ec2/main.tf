data "aws_ami" "latest-ubuntu" {
most_recent  = true
owners       = ["099720109477"]

  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.18.0"

  instance_count = 1

  key_name      = var.key_name
  name          = var.name
  ami           = data.aws_ami.latest-ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  associate_public_ip_address = true
  user_data_base64 = base64encode(var.user_data)
  tags = var.tags
  // root_block_device = [
  //   {
  //     volume_type = "gp2"
  //     volume_size = 8
  //   },
  // ]
}
