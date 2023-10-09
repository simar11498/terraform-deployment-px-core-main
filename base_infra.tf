
variable "base_infra_deployments" {
  type        = any # TODO: tighten this
  description = "base-infra workspaces to create"
  default = [
    {
      environment = "dev"
      region      = "us-west-2"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.98.64.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
    {
      environment = "nprd"
      region      = "us-west-2"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.98.72.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
    {
      environment = "nprd"
      region      = "eu-central-1"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.98.80.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
    {
      environment = "nprd"
      region      = "ap-southeast-2"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.98.88.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
    {
      environment = "prod"
      region      = "us-west-2"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.113.112.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
    {
      environment = "prod"
      region      = "eu-central-1"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.113.120.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
    {
      environment = "prod"
      region      = "ap-southeast-2"
      umbrella_dns = {
        enable          = true
        remote_state    = true
        kms_key_account = ""
        kms_key_id      = ""
        retention       = 0
        resolver_rules = [
        ]
        tags = {
        }
      },
      transit_gateway = {
        remote_state   = true
        name           = ""
        gateway_id     = ""
        route_table_id = ""
        create_tgw     = false
        share_tgw      = false
        vpc_attachments = {
        }
      },
      vpc = {
        enable = true
        cidr   = "10.113.128.0/21"
        private_subnets = {
          cidr  = "23"
          count = 3
        }
        intra_subnets = {
          cidr  = "28"
          count = 0
        }
        enable_nat_gateway            = false
        single_nat_gateway            = false
        one_nat_gateway_per_az        = false
        enable_dns_support            = true
        enable_dns_hostnames          = true
        manage_default_security_group = true
        default_security_group_ingress = [
        ]
        default_security_group_egress = [
        ]
        interface_endpoints = [
        ]
        gateway_endpoints = [
        ]
      },
    },
  ]
}

module "base_infra" {
  for_each = {
    for deployment in var.base_infra_deployments : "${deployment.environment}-${deployment.region}" => deployment
  }

  source  = "app.terraform.io/cxtfcloud/single-workspace-deployment/tfe"
  version = "~> 2.2.0"

  # Metadata
  app_lifecycle             = each.value.environment
  data_classification       = var.data_classification
  data_taxonomy             = var.data_taxonomy
  department_code           = var.department_code
  map_migrated              = var.map_migrated
  name                      = "${var.name}-base-infra"
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
  global_remote_state = var.base_infra_workspace.global_remote_state
  remote_state_workspace_ids = concat(
    [
      for deployment in module.app_infra : deployment.workspace_id
      if deployment.region == each.value.region &&
      (deployment.app_lifecycle == each.value.environment || contains(local.map_to_nprd, deployment.app_lifecycle) && each.value.environment == "nprd")
    ],
    [
      for deployment in module.app_deployments : deployment.workspace_id
      if deployment.region == each.value.region &&
      (deployment.app_lifecycle == each.value.environment || contains(local.map_to_nprd, deployment.app_lifecycle) && each.value.environment == "nprd")
    ]
  )
  tags           = [var.partition, "base-infra"]
  oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  vcs = {
    name   = module.base_infrastructure_repository_files.repository_full_name
    branch = contains(module.base_infrastructure_repository_files.branches, each.value.environment) ? each.value.environment : ""
  }
  execution_mode = var.base_infra_workspace.execution_mode
  agent_pool_id  = var.base_infra_workspace.execution_mode == "agent" ? one(data.tfe_outputs.agent_workspace[*].nonsensitive_values.aws_agents.base.agent_pool.agent_pool_id) : ""

  # Workspace Variables
  include_region       = true
  include_short_region = true
  include_tags         = true

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
      key         = "short_environment"
      value       = each.value.environment
      category    = "terraform"
      description = "The short name of the environment to deploy to"
      hcl         = false
      sensitive   = false
    },
    {
      key = "umbrella_dns"
      value = replace(jsonencode({
        enable          = each.value.umbrella_dns.enable == false ? false : null
        remote_state    = each.value.umbrella_dns.remote_state == false ? false : null
        kms_key_account = length(each.value.umbrella_dns.kms_key_account) > 0 ? each.value.umbrella_dns.kms_key_account : null
        kms_key_id      = length(each.value.umbrella_dns.kms_key_account) > 0 ? each.value.umbrella_dns.kms_key_account : null
        retention       = each.value.umbrella_dns.retention != 0 ? each.value.umbrella_dns.retention : null
        resolver_rules = length(each.value.umbrella_dns.resolver_rules) > 0 ? [
          for rule in each.value.umbrella_dns.resolver_rules : rule
        ] : null
        tags = length(each.value.umbrella_dns.tags) > 0 ? {
          for key, value in each.value.umbrella_dns.tags : key => value
        } : null
      }), "/(\".*?\"):/", "$1 = ")
      category    = "terraform"
      description = "Configuration for umbrella DNS"
      hcl         = true
      sensitive   = false
    },
    {
      key = "transit_gateway"
      value = replace(jsonencode({
        remote_state    = !each.value.transit_gateway.remote_state ? false : null
        name            = length(each.value.transit_gateway.name) > 0 ? each.value.transit_gateway.name : null
        gateway_id      = length(each.value.transit_gateway.gateway_id) > 0 ? each.value.transit_gateway.gateway_id : null
        route_table_id  = length(each.value.transit_gateway.name) > 0 ? each.value.transit_gateway.route_table_id : null
        create_tgw      = each.value.transit_gateway.create_tgw ? true : null
        share_tgw       = each.value.transit_gateway.share_tgw ? true : null
        vpc_attachments = length(each.value.transit_gateway.vpc_attachments) > 0 ? each.value.transit_gateway.vpc_attachments : null
      }), "/(\".*?\"):/", "$1 = ")
      category    = "terraform"
      description = "Configuration for the transit gateway"
      hcl         = true
      sensitive   = false
    },
    {
      key = "vpc"
      value = replace(jsonencode({
        cidr                           = each.value.vpc.cidr
        private_subnets                = each.value.vpc.private_subnets.count > 0 ? each.value.vpc.private_subnets : null
        intra_subnets                  = each.value.vpc.intra_subnets.count > 0 ? each.value.vpc.intra_subnets : null
        enable_nat_gateway             = each.value.vpc.enable_nat_gateway ? true : null
        single_nat_gateway             = each.value.vpc.single_nat_gateway ? true : null
        one_nat_gateway_per_az         = each.value.vpc.one_nat_gateway_per_az ? true : null
        enable_dns_support             = !each.value.vpc.enable_dns_support ? false : null
        enable_dns_hostnames           = !each.value.vpc.enable_dns_hostnames ? false : null
        manage_default_security_group  = !each.value.vpc.manage_default_security_group ? false : null
        default_security_group_ingress = length(each.value.vpc.default_security_group_ingress) > 0 ? each.value.vpc.default_security_group_ingress : null
        default_security_group_egress  = length(each.value.vpc.default_security_group_egress) > 0 ? each.value.vpc.default_security_group_egress : null
        interface_endpoints            = length(each.value.vpc.interface_endpoints) > 0 ? each.value.vpc.interface_endpoints : null
        gateway_endpoints              = length(each.value.vpc.gateway_endpoints) > 0 ? each.value.vpc.gateway_endpoints : null
      }), "/(\".*?\"):/", "$1 = ")
      category    = "terraform"
      description = "Configuration for the VPC"
      hcl         = true
      sensitive   = false
    },
  ], local.tfc_base_aws_creds)
}
