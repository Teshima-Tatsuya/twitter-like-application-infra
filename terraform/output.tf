output "domain" {
  value = {
    dns = module.vpc.vpc.eip_nginx.public_dns
  }
}