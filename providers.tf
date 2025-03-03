provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "azuread" {
}

provider "databricks" {
  host          = "https://accounts.azuredatabricks.net"
  azure_client_id     = var.arm_client_id
  azure_tenant_id=var.arm_tenant_id
  azure_client_secret = var.arm_client_secret
  account_id    = var.databricks_account_id 
}


provider "random" {
  # Configuration options
}
