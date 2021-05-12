variable "namespace" {
    type = string
}

variable "private_subnets" {
    type = list(string)
    default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "public_subnets" {
    type = list(string)
    default = ["10.0.31.0/24", "10.0.32.0/24", "10.0.33.0/24"]
}

variable "tags" {
    type = map(string)
    default = null
}

variable "enable_nat_gw" {
    type    = bool
    default = false
}

variable "single_nat_gw" {
    type = bool
    default = false
}