terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.46"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}
provider "azurerm" {
  features {}
}
