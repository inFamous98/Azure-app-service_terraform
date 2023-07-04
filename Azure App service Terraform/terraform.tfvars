location            = "eastus"
resource_group_name = "my-resource-group"

app_services = {
  app1 = {
    name               = "app1"
    app_service_plan   = "app-service-plan1"
    runtime            = "DOTNETCORE|3.1"
    sku                = "F1"
    tags               = {
      environment = "dev"
    }
    connection_strings = [
      "MyDbConnection=Server=mydbserver;Database=mydatabase;User Id=myuser;Password=mypassword;"
    ]
  }
  app2 = {
    name               = "app2"
    app_service_plan   = "app-service-plan2"
    runtime            = "DOTNET|5.0"
    sku                = "B1"
    tags               = {
      environment = "prod"
    }
    connection_strings = null
  }
}
