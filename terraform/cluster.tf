variable "cluster-name" {
  type    = string
  default = "ns-aks-1"
}

resource "azurerm_resource_group" "default" {
  name     = "${var.cluster-name}-rg"
  location = "westeurope"

  tags = {
    env        = "prod-DMZ"
    department = "Nakskov"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.cluster-name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.cluster-name

  default_node_pool {
    name                = "main"
    vm_size             = "Standard_b2ms"
    enable_auto_scaling = true
    min_count           = 3
    max_count           = 9
  }

  identity {
    type = "SystemAssigned"
  }

  tags = azurerm_resource_group.default.tags
}
