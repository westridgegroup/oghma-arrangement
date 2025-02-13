

resource "azurerm_databricks_workspace" "example" {
  name                = "${local.name}-databricks"
  resource_group_name = azurerm_resource_group.databricks.name
  location            = azurerm_resource_group.databricks.location
  sku                 = "standard"
  customer_managed_key_enabled = false
  public_network_access_enabled = true


  tags = local.main_tags
}
