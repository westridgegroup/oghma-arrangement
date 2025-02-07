/*******************/
/* Logging Storage */
/*******************/
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

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["108.4.72.254"]
  }

}

resource "azurerm_private_endpoint" "logging" {
  name                = "${local.name}-storage-logging-endpoint"
  location            = azurerm_resource_group.logging.location
  resource_group_name = azurerm_resource_group.logging.name
  subnet_id           = azurerm_subnet.endpoints.id

  private_service_connection {
    name                           = "${local.name}-storage-logging-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.logging.id
    subresource_names = ["blob"]
    is_manual_connection           = false
  }
}

/*******************/
/* Raw Storage     */
/*******************/
resource "azurerm_storage_account" "raw" {
  name                     = "${local.name2}raw"
  resource_group_name      = azurerm_resource_group.raw.name
  location                 = azurerm_resource_group.raw.location
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

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["108.4.72.254"]
  }

}

resource "azurerm_private_endpoint" "raw" {
  name                = "${local.name}-storage-raw-endpoint"
  location            = azurerm_resource_group.raw.location
  resource_group_name = azurerm_resource_group.raw.name
  subnet_id           = azurerm_subnet.endpoints.id

  private_service_connection {
    name                           = "${local.name}-storage-raw-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.raw.id
    subresource_names = ["blob"]
    is_manual_connection           = false
  }
}