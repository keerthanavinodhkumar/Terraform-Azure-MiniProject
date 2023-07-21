terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.65.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "${var.azure-subscription}"
  tenant_id = "${var.azure-tenant}"
  client_id = "${var.azure-client-id}"
  client_secret = "${var.azure-client-secret}"
  features {}
}