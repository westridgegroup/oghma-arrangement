

resource "azurerm_databricks_workspace" "main" {
  name                = "${local.name}-databricks"
  resource_group_name = azurerm_resource_group.databricks.name
  managed_resource_group_name = "${local.name}-databricks-managed-rg"
  location            = azurerm_resource_group.databricks.location
  sku                 = "premium"
  customer_managed_key_enabled = false # Does not match design
  public_network_access_enabled = true # Does not match design
#  enhanced_security_compliance {
#    automatic_cluster_update_enabled = false #Does not match design
#    compliance_security_profile_enabled = false #Does not match design
#   }
  custom_parameters {
    storage_account_name = "${local.name2}databricksdefault"
    storage_account_sku_name = "Premium_LRS"
  }
  tags = local.main_tags
}
