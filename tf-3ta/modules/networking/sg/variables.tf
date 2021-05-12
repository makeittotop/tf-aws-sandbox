variable "name" {
    type    = string
}

variable "description" {
    type    = string
}

variable "vpc_id" {
    type    = string
}

variable "tags" {
    type    = map(string)
}

variable "ingress_with_cidr_blocks" {
    type = list(any)
}