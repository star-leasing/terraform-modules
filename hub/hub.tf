locals {
  hub_vnet_reserved_subnet_size = 24
  hub_vnet_subnet_newbits       = local.hub_vnet_reserved_subnet_size - var.global_vnet_address_size
  hub_address_space             = [cidrsubnet(var.global_vnet_address_space, local.hub_vnet_subnet_newbits, var.hub_vnet_id)]
}

variable "hub_vnet_id" {
  type = number
}

variable "global_vnet_address_size" {
  type = number
}

variable "global_vnet_address_space" {
  type = string
}

resource "azurerm_virtual_network" "hub" {
  resource_group_name = azurerm_public_ip.gateway.resource_group_name
  location            = azurerm_public_ip.gateway.location

  name = "${var.resource_name_prefix}-hub-vnet"
  tags = merge(var.tags, {})

  address_space = local.hub_address_space
}

output "vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "vnet_name" {
  value = azurerm_virtual_network.hub.name
}

output "address_space" {
  value = azurerm_virtual_network.hub.address_space
}