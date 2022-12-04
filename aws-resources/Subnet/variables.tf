variable "vpc_id" {
  type = string
}

variable "cidr_block_aws" {
  description = "CIDR notation for subnet"
  type = list(string)
  
}

variable "tags" {
  description = "Tags to associate with resource"
  type = map(string)
  default = {}
  
}