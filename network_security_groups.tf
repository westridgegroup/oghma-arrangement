resource "azurerm_network_security_group" "databricks_private" {
  name                = "${local.name}-databricks-private"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name

    security_rule       = [
    {
        access                                     = "Allow"
        description                                = ""
        destination_address_prefix                 = "*"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "*"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "test123"
        priority                                   = 103
        protocol                                   = "Tcp"
        source_address_prefix                      = "*"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
/*    {
        access                                     = "Allow"
        description                                = "Required for Databricks control plane communication with worker nodes."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "5557"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-proxy"
        priority                                   = 102
        protocol                                   = "Tcp"
        source_address_prefix                      = "AzureDatabricks"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for Databricks control plane management of worker nodes."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "22"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-ssh"
        priority                                   = 101
        protocol                                   = "Tcp"
        source_address_prefix                      = "AzureDatabricks"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },*/
    {
        access                                     = "Allow"
        description                                = "Required for worker communication with Azure Eventhub services."
        destination_address_prefix                 = "EventHub"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "9093"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
        priority                                   = 104
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for worker nodes communication within a cluster."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "*"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
        priority                                   = 100
        protocol                                   = "*"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for worker nodes communication within a cluster."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "*"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
        priority                                   = 100
        protocol                                   = "*"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for workers communication with Azure SQL services."
        destination_address_prefix                 = "Sql"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "3306"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
        priority                                   = 102
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for workers communication with Azure Storage services."
        destination_address_prefix                 = "Storage"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "443"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
        priority                                   = 103
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for workers communication with Databricks control plane."
        destination_address_prefix                 = "AzureDatabricks"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = ""
        destination_port_ranges                    = [
            "3306",
            "443",
            "8443-8451",
                ]
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
        priority                                   = 101
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    }]
}

resource "azurerm_subnet_network_security_group_association" "databricks_private" {
  subnet_id                 = azurerm_subnet.databricks_internal.id
  network_security_group_id = azurerm_network_security_group.databricks_private.id
}

resource "azurerm_network_security_group" "databricks_public" {
  name                = "${local.name}-databricks-public"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name

    security_rule       = [
       {
        access                                     = "Allow"
        description                                = "Required for Databricks control plane communication with worker nodes."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "5557"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-proxy"
        priority                                   = 101
        protocol                                   = "Tcp"
        source_address_prefix                      = "AzureDatabricks"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for Databricks control plane management of worker nodes."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "22"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-control-plane-to-worker-ssh"
        priority                                   = 100
        protocol                                   = "Tcp"
        source_address_prefix                      = "AzureDatabricks"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for worker nodes communication within a cluster."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "*"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
        priority                                   = 102
        protocol                                   = "*"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = ""
        destination_address_prefix                 = "*"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "*"
        destination_port_ranges                    = []
        direction                                  = "Inbound"
        name                                       = "test123"
        priority                                   = 103
        protocol                                   = "Tcp"
        source_address_prefix                      = "*"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for worker communication with Azure Eventhub services."
        destination_address_prefix                 = "EventHub"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "9093"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
        priority                                   = 104
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for worker nodes communication within a cluster."
        destination_address_prefix                 = "VirtualNetwork"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "*"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
        priority                                   = 100
        protocol                                   = "*"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for workers communication with Azure SQL services."
        destination_address_prefix                 = "Sql"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "3306"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
        priority                                   = 102
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for workers communication with Azure Storage services."
        destination_address_prefix                 = "Storage"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = "443"
        destination_port_ranges                    = []
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
        priority                                   = 103
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    },
    {
        access                                     = "Allow"
        description                                = "Required for workers communication with Databricks control plane."
        destination_address_prefix                 = "AzureDatabricks"
        destination_address_prefixes               = []
        destination_application_security_group_ids = []
        destination_port_range                     = ""
        destination_port_ranges                    = [
            "3306",
            "443",
            "8443-8451",
                ]
        direction                                  = "Outbound"
        name                                       = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
        priority                                   = 101
        protocol                                   = "Tcp"
        source_address_prefix                      = "VirtualNetwork"
        source_address_prefixes                    = []
        source_application_security_group_ids      = []
        source_port_range                          = "*"
        source_port_ranges                         = []
    }]
}

resource "azurerm_subnet_network_security_group_association" "databricks_public" {
  subnet_id                 = azurerm_subnet.databricks_external.id
  network_security_group_id = azurerm_network_security_group.databricks_public.id
}

