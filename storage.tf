resource "azurerm_storage_account" "logging" {
  name                     = "${local.name2}"
  resource_group_name      = azurerm_resource_group.logging.name
  location                 = azurerm_resource_group.logging.location
  account_tier             = "Premium"
  account_replication_type = "GRS"
  account_kind = "BlockBlobStorage"
  access_tier = "Hot"
  https_traffic_only_enabled = true
  shared_access_key_enabled = false
  public_network_access_enabled = false
  default_to_oauth_authentication = true
  is_hns_enabled = false 
  local_user_enabled = false

}