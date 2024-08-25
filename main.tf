provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_group" "example" {
  name                = "example-containergroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "example-container-group"

  container {
    name   = "example-container"
    image  = var.container_image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      ENV_VAR = "value"
    }
  }

  tags = {
    environment = "testing"
  }
}

output "container_ip" {
  value = azurerm_container_group.example.ip_address
}

output "container_fqdn" {
  value = azurerm_container_group.example.fqdn
}
