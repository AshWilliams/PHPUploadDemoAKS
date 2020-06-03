provider "azurerm" {
  version = "~>1.43"
}

resource "azurerm_resource_group" "rg-aks" {
  name     = "${var.terraform_azure_resource_group}"
  location = "${var.terraform_azure_region}"
}


# ACR
resource "azurerm_container_registry" "acr01" {
  name                = "acr${var.Region}${var.Tipo["Aplicacion"]}${var.Codigo}${var.Ambiente["Produccion"]}${var.Version}"
  resource_group_name = "${azurerm_resource_group.rg-aks.name}"
  location            = "${azurerm_resource_group.rg-aks.location}"
  admin_enabled       = true
  sku                 = "Standard"
  tags = {
    environment = "${var.Ambiente["Desarrollo"]}"
  }
}

# resource "azurerm_kubernetes_cluster" "example" {
#   name                = "aksdgi"
#   location            = "${azurerm_resource_group.rg-aks.location}"
#   dns_prefix          = "akswithvnet-dgi"
#   resource_group_name = "${azurerm_resource_group.rg-aks.name}"

#   linux_profile {
#     admin_username = "acctestuser1"

#     ssh_key {
#       key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMXa3fkLQqSlrALcWNOVd+RiCsh6eYAVQSD5bp77SrptushAv3JtCtQ0oqZDh9UV6jgmVPr3G4ckia/P2C5V+uK6ceQGewnpytPzVKycJAr/wqJQ80iwgfSagZeaQwBWX/kf7Jk4KLUxVgl2agvtQ5cs1NDf2idI+SzJywXo5AEzp1RxqV4ItSEXRx9BXLXrlRQ5dI0Q0xnTUjD2B4wqbf4xYkr/hgPh/149tq2/70ZkEjaenjOEuZtWLQ2erYpdBtIniI+XEOnuuFz1ph0bYKPU06GjCONBgO6MYFjjmVsxiY785whrfbnKTFRJF+VMnWmRMCF8WDjckIO/emnp2L rorozasn@MININT-BIRK3V5"
#     }
#   }

#   agent_pool_profile {
#     name            = "agentpool"
#     count           = "2"
#     vm_size         = "Standard_DS2_v2"
#     os_type         = "Linux"
#     os_disk_size_gb = 30
#   }

#   service_principal {
#     client_id     = "${var.kubernetes_client_id}"
#     client_secret = "${var.kubernetes_client_secret}"
#   }

#   network_profile {
#     network_plugin = "azure"
#   }

#   lifecycle{
#     ignore_changes = ["linux_profile"]
#   }
# }
