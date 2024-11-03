locals {
  main_tags        = merge(var.tags, { env = var.env, state_container_name = var.state_container_name, state_key = var.state_key })
  rg_name          = "${var.prefix}-${var.env}-dbx"
  name = replace(local.rg_name,"-","")
}

resource "azurerm_resource_group" "main" {
  name     = "${local.rg_name}-rg"
  location = var.location
  tags     = local.main_tags
}
