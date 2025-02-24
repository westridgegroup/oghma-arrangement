/*******************/
/* Logging Storage */
/*******************/
resource "azurerm_storage_account" "logging" {
  name                     = "${local.name2}logging${random_string.storage.id}" #24 character limit
  resource_group_name      = azurerm_resource_group.logging.name
  location                 = azurerm_resource_group.logging.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  access_tier = "Hot"
  https_traffic_only_enabled = true
  shared_access_key_enabled = true # Does not match design
  public_network_access_enabled = true
  default_to_oauth_authentication = true
  is_hns_enabled = false 
  local_user_enabled = false
  allow_nested_items_to_be_public = false

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.local_ip #Does not match design, temp until Bastion is in place
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
  name                     = "${local.name2}raw${random_string.storage.id}"
  resource_group_name      = azurerm_resource_group.raw.name
  location                 = azurerm_resource_group.raw.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind = "StorageV2"
  access_tier = "Hot"
  https_traffic_only_enabled = true
  shared_access_key_enabled = true # Does not match design
  public_network_access_enabled = true
  default_to_oauth_authentication = true
  is_hns_enabled = true 
  local_user_enabled = false
  allow_nested_items_to_be_public = false
  blob_properties {
    
    versioning_enabled = false
    change_feed_enabled = false
    container_delete_retention_policy {
      days=360
    }
    delete_retention_policy {
      days=360
    }
 
  }

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.local_ip
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

/*******************/
/* Refiined Storage*/
/*******************/

resource "azurerm_storage_account" "refined" {
  name                     = "${local.name2}refined${random_string.storage.id}"
  resource_group_name      = azurerm_resource_group.refined.name
  location                 = azurerm_resource_group.refined.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind = "BlockBlobStorage"
  #access_tier = "Hot"
  https_traffic_only_enabled = true
  shared_access_key_enabled = true # Does not match design
  public_network_access_enabled = true
  default_to_oauth_authentication = true
  is_hns_enabled = true 
  local_user_enabled = false
  allow_nested_items_to_be_public = false

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.local_ip
  }

}

resource "azurerm_private_endpoint" "refined" {
  name                = "${local.name}-storage-refined-endpoint"
  location            = azurerm_resource_group.refined.location
  resource_group_name = azurerm_resource_group.refined.name
  subnet_id           = azurerm_subnet.endpoints.id

  private_service_connection {
    name                           = "${local.name}-storage-refined-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.refined.id
    subresource_names = ["blob"]
    is_manual_connection           = false
  }
}

