output "domain" {
  value = {
    dns = module.vpc.vpc.eni_nginx.public_dns
  }
}