locals {
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_name_prefix" {
  description = "Name prefix for all resources"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(any)
}