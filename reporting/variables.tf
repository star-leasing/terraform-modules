locals {
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}
