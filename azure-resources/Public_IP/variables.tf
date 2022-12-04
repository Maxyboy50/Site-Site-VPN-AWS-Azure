variable "resource_group_name" {
  description = "This is the resource group the public IP belongs to"
  type        = string
}
variable "location" {
  description = "This is the location the public IP belongs to"
  type        = string
}

variable "public_ip_name" {
  description = "Name that will be assigned to public_ip"
  type = string
}

variable "allocation_method"{
  description = "Determines whether IP address will be generated upon resource creation or assignment to another resource"
  type = string
  default = "Dynamic"
}