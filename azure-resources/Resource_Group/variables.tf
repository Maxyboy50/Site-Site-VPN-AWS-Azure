variable "resource_group_name"{
    description = "Name to assign to resource group"
    type = string
}

variable "resource_group_location"{
    description = "Location to build the resource group in"
    type = string
    default = "East US"
}