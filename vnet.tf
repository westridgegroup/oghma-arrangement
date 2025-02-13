resource "azurerm_virtual_network" "primary" {
  name                = "${local.name}-primary"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = ["10.30.0.0/16"]


  tags = local.main_tags
}

resource "azurerm_subnet" "endpoints" {
  name                 = "endpoints-subnet"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.30.3.0/24"]
  private_link_service_network_policies_enabled = true

}

resource "azurerm_subnet" "databricks_internal" {
  name                 = "databricks-internal-subnet"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.30.1.0/24"]
  private_link_service_network_policies_enabled = true
}

resource "azurerm_subnet" "databricks_external" {
  name                 = "databricks-external-subnet"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.30.2.0/24"]
  private_link_service_network_policies_enabled = true
}
