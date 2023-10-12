locals {
  # Loop through the nested input 'app_deployments' and produces a flattened list of objects.
  #   the innermost object of 'app_deployments.lifecycle_region_config' gets merged in to produce the following:
  # [{
  #   workload          = "workload-1-name"
  #   app_lifecycle     = "dev"
  #   region            = "us-west-2"
  #   terraform_version = "~> 1.3.0"
  #   auto_applies      = true
  # },{
  #   workload          = "workload-2-name"
  #   app_lifecycle     = "dev"
  #   region            = "us-west-2"
  #   terraform_version = "~> 1.3.0"
  #   auto_applies      = true
  # },{
  #   workload          = "workload-1-name"
  #   app_lifecycle     = "test"
  #   region            = "us-west-2"
  #   terraform_version = "~> 1.3.0"
  #   auto_applies      = false
  # }...
  app_workspaces = flatten([
    for workload in var.app_deployments.workloads : [
      for app_lifecycle, app_value in var.app_deployments.lifecycle_region_config : [
        for region, region_value in app_value : merge({
          workload      = workload
          app_lifecycle = app_lifecycle
          region        = region
          },
        region_value)
      ]
    ]
  ])
}

variable "app_deployments" {
  description = "A map of environments to regions and env specific inputs, and a list of workloads to use this region/lifecycle configuration"
  type = object({
    lifecycle_region_config = map(map(object({
      terraform_version = optional(string, "~> 1.3.0")
      auto_applies      = optional(bool, false)
    })))
    workloads = list(string)
  })
  default = {
    lifecycle_region_config = {
      dev = {
        us-west-2 = {
          auto_applies = true
        }
      }
      test = {
        us-west-2 = {}
      }
      stage = {
        us-west-2 = {}
      }
      perf = {
        us-west-2      = {}
        ap-southeast-2 = {}
        eu-central-1   = {}
      }
    }
    workloads = [
      "px-core",
      "cxpp-hcaas-ms",
      "cxpp-user-management",
      "cxpp-user-management-scheduler",
      "cxpp-training-enablement",
      "cxpp-database",
      "cxpp-partner-info",
      "cxpp-partner-info-scheduler",
      "cxpp-portal-support",
      "cxpp-customer-portal-mirror",
      "cxpp-portal-feedback",
      "cxpp-orders-management",
      "cxpp-lca-ms",
      "cxpp-admin-config-lambda"
    ]
  }
}

module "app_deployments" {
  source  = "app.terraform.io/cxtfcloud/single-workspace-deployment/tfe"
  version = "~> 2.2.0"

  for_each = {
    for deployment in local.app_workspaces : "${deployment.workload}-${deployment.app_lifecycle}-${deployment.region}" => deployment
  }

  app_lifecycle             = each.value.app_lifecycle
  data_classification       = var.data_classification
  data_taxonomy             = var.data_taxonomy
  department_code           = var.department_code
  map_migrated              = var.map_migrated
  name                      = each.value.workload
  organization              = var.organization
  owner_mail_alias          = var.owner_mail_alias
  portal_name               = var.portal_name
  resource_owner_mail_alias = var.resource_owner_mail_alias
  tile_application          = var.tile_application
  track_name                = var.name

  global_remote_state = false
  auto_apply          = each.value.auto_applies
  region              = each.value.region
  terraform_version   = each.value.terraform_version
  teams               = var.teams

  include_region       = true
  include_short_region = true
  include_kms          = true
  include_tags         = true
  variables = setunion([
    {
      key         = "iam_assumed_role_arn"
      value       = "arn:aws:iam::${local.accounts[local.app_lifecycle_to_env_map[each.value.app_lifecycle]]}:role/TerraformCloud_sg1"
      category    = "terraform"
      description = "The role to assume to deploy the resources"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "name"
      value       = each.value.workload
      category    = "terraform"
      description = "The name of the workload being deployed"
      hcl         = false
      sensitive   = false
    }
  ], local.tfc_sg1_aws_creds)
}
