variable "cloud_account_deployments" {
  type        = any # TODO: tighten this
  description = "cloud account workspaces to create"
  default = {
    dev = {
      business_application_name = "CX Cloud"
      business_contact          = ""
      data_classification       = "Confidential"
      email                     = "px-core-dev@cisco.com"
      environment               = "dev"
      estimated_cost            = "2707"
      security_contact          = ""
      technical_contact         = ""
    }
    nprd = {
      business_application_name = "CX Cloud"
      business_contact          = ""
      data_classification       = "Confidential"
      email                     = "px-core-nprd@cisco.com"
      environment               = "nprd"
      estimated_cost            = "13533"
      security_contact          = ""
      technical_contact         = ""
    }
    prod = {
      business_application_name = "CX Cloud"
      business_contact          = ""
      data_classification       = "Confidential"
      email                     = "px-core-prod@cisco.com"
      environment               = "prod"
      estimated_cost            = "11547"
      security_contact          = ""
      technical_contact         = ""
    }
  }
}


module "cloud_account" {
  for_each = var.cloud_account_deployments

  source  = "app.terraform.io/cxtfcloud/single-workspace-deployment/tfe"
  version = "~> 2.2.0"

  # Metadata
  app_lifecycle             = each.value.environment
  data_classification       = var.data_classification
  data_taxonomy             = var.data_taxonomy
  department_code           = var.department_code
  map_migrated              = var.map_migrated
  name                      = "${var.name}-cloud-account"
  organization              = var.organization
  owner_mail_alias          = var.owner_mail_alias
  portal_name               = var.portal_name
  resource_owner_mail_alias = var.resource_owner_mail_alias
  tile_application          = var.tile_application
  partition                 = var.partition

  # Deployment Configuration
  track_name = title(var.name)
  teams = [
    {
      name   = "IAM_Admin"
      access = null
      permissions = {
        runs              = "apply"
        variables         = "write"
        state             = "read-outputs"
        sentinel_mocks    = "read"
        workspace_locking = false
      }
    },
  ]
  global_remote_state = var.cloud_account_workspace.global_remote_state
  remote_state_workspace_ids = concat([],
    values({
      for app_deployment_key, app_deployment_value in module.app_deployments : app_deployment_key => app_deployment_value.workspace_id
      if(can(regex(".*${each.key}.*", app_deployment_key)) || (each.key == "nprd" && contains(local.map_to_nprd, app_deployment_value.app_lifecycle)))
    }),
    values({
      for app_infra_deployment_key, app_infra_deployment_value in module.app_infra : app_infra_deployment_key => app_infra_deployment_value.workspace_id
      if(can(regex(".*${each.key}.*", app_infra_deployment_key)) || (each.key == "nprd" && contains(local.map_to_nprd, app_infra_deployment_value.app_lifecycle)))
    }),
    values({
      for base_deployment_key, base_deployment_value in module.base_infra : base_deployment_key => base_deployment_value.workspace_id
      if(can(regex(".*${each.key}.*", base_deployment_key)) || (each.key == "nprd" && contains(local.map_to_nprd, base_deployment_value.app_lifecycle)))
    })
  )
  tags           = [var.partition, "cloud-account"]
  oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  vcs = {
    name   = module.cloud_account_repository_files.repository_full_name
    branch = contains(module.cloud_account_repository_files.branches, each.value.environment) ? each.value.environment : ""
  }
  execution_mode = var.cloud_account_workspace.execution_mode
  agent_pool_id  = var.cloud_account_workspace.execution_mode == "agent" ? one(data.tfe_outputs.agent_workspace[*].nonsensitive_values.agent_pool_on_prem.agent_pool_id) : ""
  # Workspace Variables
  variable_set_ids = [lookup(one(data.tfe_outputs.organization[*].nonsensitive_values.variable_set_ids), "runon_variables", "")]
  variables = [
    {
      key         = "name"
      value       = var.name
      category    = "terraform"
      description = "The name of the workload to deploy the base infrastructure"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "organizational_unit_name"
      value       = "sg1-aws-${each.value.environment}"
      category    = "terraform"
      description = "The name of the organization unit the cloud account is associated with"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "account_lifecycle"
      value       = each.value.environment
      category    = "terraform"
      description = "The environment the account is associated with"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "email"
      value       = each.value.email
      category    = "terraform"
      description = "The email address of the person or team for the account"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "estimated_cost"
      value       = each.value.estimated_cost
      category    = "terraform"
      description = "The estimated cost of the infrastructure within the account"
      hcl         = false
      sensitive   = false
    },
  ]
}

moved {
  from = module.cloud_account_dev
  to   = module.cloud_account["dev"]
}
moved {
  from = module.cloud_account_nprd
  to   = module.cloud_account["nprd"]
}
moved {
  from = module.cloud_account_prod
  to   = module.cloud_account["prod"]
}
