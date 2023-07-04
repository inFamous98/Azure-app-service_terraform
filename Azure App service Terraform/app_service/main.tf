resource "azurerm_app_service_plan" "app_service_plan" {
  for_each             = var.app_services

  name                 = each.value.app_service_plan
  location             = var.location
  resource_group_name  = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_services" {
  for_each             = var.app_services

  name                 = each.value.name
  location             = var.location
  resource_group_name  = var.resource_group_name
  app_service_plan_id  = azurerm_app_service_plan.app_service_plan[each.key].id

  site_config {
    always_on           = true
    min_tls_version     = "1.2"
    use_32_bit_worker_process = false
  }

  app_settings = each.value.connection_strings != null ? merge(each.value.tags, {
    "ConnectionStrings" = join(";", each.value.connection_strings)
  }) : each.value.tags
}
