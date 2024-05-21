data "terraform_remote_state" "domain-management" {
  backend = "remote"

  config = {
    organization = "teshima"
    workspaces = {
      name = "terraform-aws-domain-management"
    }
  }
}