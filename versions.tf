# Configure the Azure provider
terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
   azapi = {
      source = "azure/azapi"
    }
  }

  required_version = ">= 1.10.5"
}


