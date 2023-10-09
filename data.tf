data "tfe_oauth_client" "client" {
  organization = var.organization
  name         = "GitHub.com CXEPI (as cx-terraform-cloud)"
}
