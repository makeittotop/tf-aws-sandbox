variable "ssh_keypair" {
  description = "SSH keypair to use for EC2 instance"
  default     = null
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
  type        = string
}

variable "aws_profile" {
    type      = string
    default   = null
}

variable "aws_creds_file" {
    type    = string
    default = null
}

variable "project" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "enable_nat_gw" {
    description = "enable nat gateway"
    type = bool
}

variable "single_nat_gw" {
    description = "single nat gateway"
    type = bool
}

variable "environment" {
    type = string
    default = null
}

variable "private_subnets" {
    type = list(string)
}

variable "public_subnets" {
    type = list(string)
}

variable "tags" {
    type = map(string)
}

variable "bastion_sg_description" {
    type = string
    default = "sg for ssh communication between internet and bastion hosts"
}

variable "bastion_ingress_with_cidr_blocks" {
    type = list(any)
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "pub_key_path" {
    type = string
}

variable "key_name" {
    type = string
}
