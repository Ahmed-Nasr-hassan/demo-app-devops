terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.5"
    }
  }
}

provider "azurerm" {
  features {}
} 