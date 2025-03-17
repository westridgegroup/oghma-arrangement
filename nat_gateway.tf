resource "azurerm_public_ip" "nat_gateway" {
  name                = "${local.name}-nat-gateway-pip"
  location            = azurerm_resource_group.nat_gateway.location
  resource_group_name = azurerm_resource_group.nat_gateway.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "primary" {
  name                = "${local.name}-databricks-nat-gateway"
  location            = azurerm_resource_group.nat_gateway.location
  resource_group_name = azurerm_resource_group.nat_gateway.name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "primary" {
  nat_gateway_id       = azurerm_nat_gateway.primary.id
  public_ip_address_id = azurerm_public_ip.nat_gateway.id
}

resource "azurerm_subnet_nat_gateway_association" "primary" {
  subnet_id      = azurerm_subnet.databricks_external.id
  nat_gateway_id = azurerm_nat_gateway.primary.id
}