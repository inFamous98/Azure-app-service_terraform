module "app_services" {
  source              = "./app_service"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_services        = var.app_services
}
