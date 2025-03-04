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


# Accounts
resource "databricks_group" "admin" {
  display_name               = var.admin
  allow_cluster_create       = true
  allow_instance_pool_create = true
}

resource "databricks_mws_permission_assignment" "add_admin_group" {
  workspace_id = azurerm_databricks_workspace.main.workspace_id
  principal_id = databricks_group.admin.id
  permissions  = ["ADMIN"]
}



module "databricks_group_users" {
    for_each = toset(data.azuread_group.admin.members)
    source = "./databricks_group_users"
    user_object_id = "${each.key}"
}

output "databricks_group_users_output" {
    value=module.databricks_group_users
}