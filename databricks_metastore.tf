data "databricks_metastore" "location" {
    region=azurerm_resource_group.databricks.location
}

output "metastore_id" {
  value = data.databricks_metastore.location.id
}

resource "databricks_metastore_assignment" "main" {
  metastore_id = data.databricks_metastore.location.id
  workspace_id = azurerm_databricks_workspace.main.workspace_id
}
