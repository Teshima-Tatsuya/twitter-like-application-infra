locals {
  services = {
    nginx = {
        service_name = "nginx-service"
        port_name = "http-80"
        port = 80
    }
    rails = {
        service_name = "rails-service"
        port_name = "http-3000"
        port = 3000
     }
  }
}