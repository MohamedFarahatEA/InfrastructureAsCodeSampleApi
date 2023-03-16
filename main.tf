terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {

  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg_storage_tf_state"
    storage_account_name = "tfstorageforstate"
    container_name       = "tfdata"
    key                  = "terraform.tfstate"
  }
}

## Create a Resource Group for Storage
resource "azurerm_resource_group" "tf_rg_sampleapi" {
  location = "uaenorth"
  name     = "mohamedfarhattfrg"
}

## create the container group
resource "azurerm_container_group" "tf_cg_sampleapi" {
  name                = "cg_sampleapi"
  location            = azurerm_resource_group.tf_rg_sampleapi.location
  resource_group_name = azurerm_resource_group.tf_rg_sampleapi.name

  ip_address_type = "public"
  dns_name_label  = "sampleapitf"
  os_type         = "Linux"


  container {
    name   = "sampleapi"
    image  = "mohamedfarhat01/sampleapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}
