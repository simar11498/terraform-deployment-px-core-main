
variable "app_infra_deployments" {
  type = list(object({
    environment = optional(string, "dev")
    region      = optional(string, "us-west-2")
  }))
  description = "app-infra workspaces to create"
  default = [
    {
      environment = "dev"
      region      = "us-west-2"
    },
    {
      environment = "test"
      region      = "us-west-2"
    },
    {
      environment = "stage"
      region      = "us-west-2"
    },
    {
      environment = "perf"
      region      = "us-west-2"
    },
    {
      environment = "perf"
      region      = "eu-central-1"
    },
    {
      environment = "perf"
      region      = "ap-southeast-2"
    },
    {
      environment = "prod"
      region      = "us-west-2"
    },
    {
      environment = "prod"
      region      = "eu-central-1"
    },
    {
      environment = "prod"
      region      = "ap-southeast-2"
    },
  ]
}


module "app_infra" {
  for_each = {
    for deployment in var.app_infra_deployments : "${deployment.environment}-${deployment.region}" => deployment
  }

  source  = "app.terraform.io/cxtfcloud/single-workspace-deployment/tfe"
  version = "~> 2.2.0"

  # Metadata
  app_lifecycle             = each.value.environment
  data_classification       = var.data_classification
  data_taxonomy             = var.data_taxonomy
  department_code           = var.department_code
  map_migrated              = var.map_migrated
  name                      = "${var.name}-app-infra"
  organization              = var.organization
  owner_mail_alias          = var.owner_mail_alias
  portal_name               = var.portal_name
  resource_owner_mail_alias = var.resource_owner_mail_alias
  tile_application          = var.tile_application
  partition                 = var.partition

  # Deployment Configuration
  region              = each.value.region
  track_name          = title(var.name)
  teams               = var.teams
  global_remote_state = var.app_infra_workspace.global_remote_state
  // TODO: clean this up
  // we take the map of all module.app_deployments, compare the keys to the current region/environment. if they match,
  // then set the app_deployment as a remote state consumer of this app_infra
  // the `values()` function is used to discard the keys, because we don't care about them but we have to consume the
  // app_deployments as a map in order to get access to the keys within the loop for the conditional
  remote_state_workspace_ids = values({
    for app_deployment_key, app_deployment_value in module.app_deployments : app_deployment_key => app_deployment_value.workspace_id
    if can(regex(".*${each.value.region}.*", app_deployment_key)) && can(regex(".*${each.value.environment}.*", app_deployment_key))
  })
  tags           = [var.partition, "app-infra"]
  oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  vcs = {
    name   = module.app_infrastructure_repository_files.repository_full_name
    branch = contains(module.app_infrastructure_repository_files.branches, each.value.environment) ? each.value.environment : ""
  }
  execution_mode = var.app_infra_workspace.execution_mode
  agent_pool_id  = var.app_infra_workspace.execution_mode == "agent" ? one(data.tfe_outputs.agent_workspace[*].nonsensitive_values.aws_agents.sg1.agent_pool.agent_pool_id) : ""

  # Workspace Variables
  include_region        = true
  include_short_region  = true
  include_tags          = true
  include_app_lifecycle = true
  variables = setunion([
    {
      key         = "name"
      value       = var.name
      category    = "terraform"
      description = "The name of the workload to deploy the base infrastructure"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "aws_account_short_environment"
      value       = contains(["test", "stage", "perf", "nprd"], each.value.environment) ? "nprd" : each.value.environment
      category    = "terraform"
      description = "The shortened environment name of the AWS Account used."
      hcl         = false
      sensitive   = false
    }
  ], local.tfc_sg1_aws_creds)
}
