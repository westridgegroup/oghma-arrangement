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
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "3.1.0"
    }

  }

  #open tofu version
  required_version = ">= 1.9.0"
}


