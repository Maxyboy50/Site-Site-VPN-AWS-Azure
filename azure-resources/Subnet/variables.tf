variable "resource_group_name"{
    type = string
}
variable "virtual_network_name"{
    type = string
}
variable "cidr_notation_subnets"{
    type = list(string)
}
variable "subnet_name"{
    type = string
}