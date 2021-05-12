variable "aws_region" {
    type = string
    default = "ap-southeast-2"
}

variable "aws_profile" {
    type = string
}

variable "aws_creds_file" {
    type = string
}

variable "ami_most_recent" {
    type    = bool
    default = true
}

variable "ami_owners" {
    type    = string
}

variable "ami_filter" {
    type    = string
    default = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
}

variable "ami_virt_type" {
    type = string
    default = "hvm"
}

variable "pub_key_path" {
    type = string
}

variable "priv_key_path" {
    type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_tags" {
  type    = map(string)
}

variable "ec2_user" {
    type = string
    default = "ubuntu"
}