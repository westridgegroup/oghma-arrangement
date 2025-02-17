

resource "azurerm_databricks_workspace" "main" {
  name                = "${local.name}-databricks"
  resource_group_name = azurerm_resource_group.databricks.name
  managed_resource_group_name = "${local.name}-databricks-managed-rg"
  location            = azurerm_resource_group.databricks.location
  sku                 = "premium"
  customer_managed_key_enabled = false # Does not match design
  public_network_access_enabled = false # Does not match design
  network_security_group_rules_required = "NoAzureDatabricksRules"
#  enhanced_security_compliance {
#    automatic_cluster_update_enabled = false #Does not match design
#    compliance_security_profile_enabled = false #Does not match design
#   }
  custom_parameters {
    storage_account_name = "${local.name2}dbxworkspace"
    storage_account_sku_name = "Standard_GRS"
    public_subnet_name= azurerm_subnet.databricks_external.name
    private_subnet_name = azurerm_subnet.databricks_internal.name
    virtual_network_id = azurerm_virtual_network.primary.id
    public_subnet_network_security_group_association_id = azurerm_network_security_group.databricks_public.id
    private_subnet_network_security_group_association_id = azurerm_network_security_group.databricks_private.id
    no_public_ip = true
  }
  tags = local.main_tags
}
