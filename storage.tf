resource "azurerm_storage_account" "logging" {
  name                     = "${local.name2}logging"
  resource_group_name      = azurerm_resource_group.logging.name
  location                 = azurerm_resource_group.logging.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind = "BlockBlobStorage"
  #access_tier = "Hot"
  https_traffic_only_enabled = true
  shared_access_key_enabled = true # Does not match design
  public_network_access_enabled = false
  default_to_oauth_authentication = true
  is_hns_enabled = false 
  local_user_enabled = false
  allow_nested_items_to_be_public = false

}