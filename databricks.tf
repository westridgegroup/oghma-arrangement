

resource "azurerm_databricks_workspace" "main" {
  name                = "${local.name}-databricks"
  resource_group_name = azurerm_resource_group.databricks.name
  managed_resource_group_name = "${local.name}-databricks-managed-rg"
  location            = azurerm_resource_group.databricks.location
  sku                 = "premium"
  customer_managed_key_enabled = false # Does not match design
  public_network_access_enabled = true # Does not match design, need more infrastructure to make this work
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


resource "azurerm_monitor_diagnostic_setting" "databricks_main" {
  name               = "${local.name}-databricks_logging"
  target_resource_id = azurerm_databricks_workspace.main.id
  storage_account_id = azurerm_storage_account.logging.id
  enabled_log {
    category = "accounts"
  }
  #enabled_log {
  #  category = "aibiGenie"
  #}
  enabled_log {
    category = "clusters"
  }
#  enabled_log {
#    category = "clusterpolicies"
#  }
  enabled_log {
    category = "dashboards"
  }
  enabled_log {
    category = "databrickssql"
  }
  
  enabled_log {
    category = "dataMonitoring"
  }
  enabled_log {
    category = "dbfs"
  }
  enabled_log {
    category = "deltaPipelines"
  }
  enabled_log {
    category = "featureStore"
  }
  /*enabled_log {
    category = "filesystem"
  }
  enabled_log {
    category = "genie"
  }
  enabled_log {
    category = "gitCredentials"
  }
  enabled_log {
    category = "globalInitScripts"
  }
#  enabled_log {
#    category = "groups"
#  }
  enabled_log {
    category = "iamRole"
  }
  enabled_log {
    category = "ingenstion"
  }
  enabled_log {
    category = "instancePools"
  }
  enabled_log {
    category = "jobs"
  }
  enabled_log {
    category = "lineageTracking"
  }
  enabled_log {
    category = "marketplaceConsumer"
  }
  enabled_log {
    category = "marketplaceProvider"
  }
  enabled_log {
    category = "mlflowAcledArtifact"
  }
  enabled_log {
    category = "mlflowExperiment"
  }
  enabled_log {
    category = "modelRegistry"
  }
  enabled_log {
    category = "notebook"
  }
  enabled_log {
    category = "partnerConnect"
  }
  enabled_log {
    category = "predictiveOptimization"
  }
  enabled_log {
    category = "RemoteHistoryService"
  }
  enabled_log {
    category = "repos"
  }
  enabled_log {
    category = "secrets"
  }
  enabled_log {
    category = "serverlessRealTimeInference"
  }
  enabled_log {
    category = "sqlPermissions"
  }
  enabled_log {
    category = "ssh"
  }
  #enabled_log {
  #  category = "vectorsearch"
  #}
  enabled_log {
    category = "webTerminal"
  }
  enabled_log {
    category = "workspace"
  }
*/
}