data "azuread_group" "admin" {
  display_name     = var.admin
  security_enabled = true
}

output "admin_object_id" {
    value = data.azuread_group.admin.object_id
}

resource "azurerm_role_assignment" "admin_storage_blob_data_owner_raw" {
  scope                = azurerm_resource_group.raw.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azuread_group.admin.object_id
}
resource "azurerm_role_assignment" "admin_storage_blob_data_contributor_raw" {
  scope                = azurerm_resource_group.raw.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_group.admin.object_id
}
resource "azurerm_role_assignment" "admin_storage_blob_data_reader_raw" {
  scope                = azurerm_resource_group.raw.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = data.azuread_group.admin.object_id
}



resource "azurerm_role_assignment" "admin_storage_blob_data_owner_refined" {
  scope                = azurerm_resource_group.refined.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azuread_group.admin.object_id
}
resource "azurerm_role_assignment" "admin_storage_blob_data_contributor_refined" {
  scope                = azurerm_resource_group.refined.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_group.admin.object_id
}
resource "azurerm_role_assignment" "admin_storage_blob_data_reader_refined" {
  scope                = azurerm_resource_group.refined.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = data.azuread_group.admin.object_id
}



resource "azurerm_role_assignment" "admin_storage_blob_data_owner_logging" {
  scope                = azurerm_resource_group.logging.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azuread_group.admin.object_id
}
resource "azurerm_role_assignment" "admin_storage_blob_data_contributor_logging" {
  scope                = azurerm_resource_group.logging.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_group.admin.object_id
}
resource "azurerm_role_assignment" "admin_storage_blob_data_reader_logging" {
  scope                = azurerm_resource_group.logging.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = data.azuread_group.admin.object_id
}
