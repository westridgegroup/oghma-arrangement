locals {
  main_tags        = merge(var.tags, { env = var.env, state_container_name = var.state_container_name, state_key = var.state_key })
  name          = "${var.prefix}-${var.env}"
  name2 = replace(local.name,"-","")
}

resource "azurerm_resource_group" "vnet" {
  name     = "${local.name}-vnet-rg"
  location = var.location
  tags     = local.main_tags
}
