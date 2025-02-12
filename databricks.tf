

resource "azurerm_databricks_workspace" "example" {
  name                = "${local.name}-databricks"
  resource_group_name = azurerm_resource_group.databricks.name
  location            = azurerm_resource_group.databricks.location
  sku                 = "standard"

  tags = local.main_tags
}
