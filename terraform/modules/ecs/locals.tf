locals {
  services = {
    nginx = {
        service_name = "nginx-service"
        port_name = "http-80"
    }
    /* rails = {
        service_name = "rails-service"
        port_name = "http-80"
     }
     */
  }
}