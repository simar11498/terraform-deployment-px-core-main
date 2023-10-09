data "tfe_outputs" "organization" {
  count = var.remote_state_config.enable ? 1 : 0

  organization = var.remote_state_config.organization
  workspace    = var.remote_state_config.organization_workspace
}

data "tfe_outputs" "agent_workspace" {
  count = contains([var.base_infra_workspace.execution_mode, var.app_infra_workspace.execution_mode, var.cloud_account_workspace.execution_mode], "agent") ? 1 : 0

  organization = var.organization
  workspace    = var.organization == "cxtfcloud" ? "tfc-agents-app-infra-prod-usw2" : "tfc-agents-app-infra-nprd-usw2"
}
