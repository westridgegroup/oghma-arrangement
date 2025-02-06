resource "azurerm_virtual_network" "primary" {
  name                = "example-network"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = ["10.30.0.0/16"]


  tags = local.main_tags
}