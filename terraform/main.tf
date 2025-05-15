provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "devops_rg"{
    name = "devops-rg"
    location = "East US"
}

resource "azurerm_container_registry" "acr" {
    name = "devopsacr1234"
    resource_group_name = azurerm_resource_group.devops_rg.name
    location = azurerm_resource_group.devops_rg.location
    sku= "Basic"
    admin_enabled = true
}

resource "azurerm_kubernetes_cluster" "aks"{
    name = "devops-aks"
    location = azurerm_resource_group.devops_rg.location
    resource_group_name = azurerm_resource_group.devops_rg.name
    dns_prefix = "devops-aks"
    
    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_DS2_v2"
    }

    identity {
        type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name            = "AcrPull"
  scope                           = azurerm_container_registry.acr.id
}

