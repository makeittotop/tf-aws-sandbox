variable "name" {
    type = string
}

variable "key_name" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "subnet_id" {
    type = string
}

// variable "subnet_ids" {
//     type = list(string)
// }

variable "vpc_security_group_ids" {
    type = string
}

variable "user_data" {
    type = string
}

variable "tags" {
    type = map(string)
}

variable "instance_count" {
    type    = number
    default = 1
}

// variable "" {
//     type = string
// }

