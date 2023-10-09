output "organization" {
  description = "The name of the Terraform cloud organization this workspace resides in"
  value       = var.organization
}

output "base_infrastructure_workspace_ids" {
  description = "A map of the base infrastructure workspace IDs based on workspace name"
  value = {
    for ws in module.base_infra : ws.workspace_name => ws.workspace_id
  }
}

output "app_infrastructure_workspace_ids" {
  description = "A map of the app infrastructure workspace IDs based on workspace name"
  value = {
    for ws in module.app_infra : ws.workspace_name => ws.workspace_id
  }
}

output "cloud_account_workspace_ids" {
  description = "A map of the cloud account workspace IDs based on workspace name"
  value = {
    for ws in module.cloud_account : ws.workspace_name => ws.workspace_id
  }
}
