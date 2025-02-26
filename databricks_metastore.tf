resource "databricks_metastore" "this" {
  name = "primary"
  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
    azurerm_storage_container.metastore.name,
  azurerm_storage_account.raw.name)
  owner         = var.admin
  region        = azurerm_resource_group.raw.location
  force_destroy = true
}

resource "azurerm_storage_account" "metastore" {

}

#resource "databricks_metastore_assignment" "this" {
#  metastore_id = databricks_metastore.this.id
#  workspace_id = local.workspace_id
#}
