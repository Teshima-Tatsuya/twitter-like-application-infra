locals {
    acm = {
        certificate_global_arn = data.terraform_remote_state.domain-management.outputs.domain.certificate_global_arn
    }
}