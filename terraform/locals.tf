locals {
    cloudfront = {
        domain_name = "twitter.${data.terraform_remote_state.domain-management.outputs.domain.domain_name}"
        backend_domain_name = "backend.${data.terraform_remote_state.domain-management.outputs.domain.domain_name}"
        certificate_global_arn = data.terraform_remote_state.domain-management.outputs.domain.certificate_global_arn
    }
    route53 = {
        domain_name = data.terraform_remote_state.domain-management.outputs.domain.domain_name
        zone_id = data.terraform_remote_state.domain-management.outputs.domain.zone_id
    }
}