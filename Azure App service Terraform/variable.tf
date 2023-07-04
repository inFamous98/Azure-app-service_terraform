variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "app_services" {
  description = "The configurations for the Azure App Services."
  type        = map(object({
    name               = string
    app_service_plan   = string
    runtime            = string
    sku                = string
    tags               = map(string)
    connection_strings = list(string)
  }))
}
