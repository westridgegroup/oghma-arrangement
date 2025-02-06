resource "azurerm_virtual_network" "primary" {
  name                = "${local.name}-primary"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = ["10.30.0.0/16"]


  tags = local.main_tags
}

resource "azurerm_subnet" "endpoints" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.30.3.0/24"]
  private_link_service_network_policies_enabled = true

}