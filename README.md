# terraform-deployment-px-core

This repository manages the Terraform Cloud and GitHub related resources for the px-core workload.

#### Table
1. [Usage](#usage)
2. [Requirements](#requirements)
3. [Providers](#providers)
4. [Inputs](#inputs)
5. [Outputs](#outputs)

## Usage

To contribute to this repository, please read the [contributing guide.](./CONTRIBUTING.md)

Below is a table of the environment(s) that this workspace manages along with helpful links to navigate to the associated Terraform Cloud workspace or the GitHub repository/associated branch:

| Terraform Cloud Workspace | GitHub Repository |
|------|---------|
| [px-core-cloud-account-dev](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-cloud-account-dev) | [dev](https://github.com/CXEPI/terraform-workspace-px-core-cloud-account/tree/dev)|
| [px-core-cloud-account-nprd](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-cloud-account-nprd) | [nprd](https://github.com/CXEPI/terraform-workspace-px-core-cloud-account/tree/nprd)|
| [px-core-cloud-account-prod](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-cloud-account-prod) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-cloud-account/tree/prod)|
| [px-core-base-infra-dev-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-dev-usw2) | [dev](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/dev)|
| [px-core-base-infra-nprd-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-nprd-usw2) | [nprd](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/nprd)|
| [px-core-base-infra-nprd-euc1](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-nprd-euc1) | [nprd](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/nprd)|
| [px-core-base-infra-nprd-apse2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-nprd-apse2) | [nprd](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/nprd)|
| [px-core-base-infra-prod-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-prod-usw2) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/prod)|
| [px-core-base-infra-prod-euc1](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-prod-euc1) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/prod)|
| [px-core-base-infra-prod-apse2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-base-infra-prod-apse2) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-base-infra/tree/prod)|
| [px-core-app-infra-dev-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-dev-usw2) | [dev](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/dev)|
| [px-core-app-infra-test-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-test-usw2) | [test](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/test)|
| [px-core-app-infra-stage-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-stage-usw2) | [stage](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/stage)|
| [px-core-app-infra-perf-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-perf-usw2) | [perf](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/perf)|
| [px-core-app-infra-perf-euc1](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-perf-euc1) | [perf](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/perf)|
| [px-core-app-infra-perf-apse2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-perf-apse2) | [perf](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/perf)|
| [px-core-app-infra-prod-usw2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-prod-usw2) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/prod)|
| [px-core-app-infra-prod-euc1](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-prod-euc1) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/prod)|
| [px-core-app-infra-prod-apse2](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-app-infra-prod-apse2) | [prod](https://github.com/CXEPI/terraform-workspace-px-core-app-infra/tree/prod)|

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.48.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_deployments"></a> [app\_deployments](#module\_app\_deployments) | app.terraform.io/cxtfcloud/single-workspace-deployment/tfe | ~> 2.2.0 |
| <a name="module_app_infra"></a> [app\_infra](#module\_app\_infra) | app.terraform.io/cxtfcloud/single-workspace-deployment/tfe | ~> 2.2.0 |
| <a name="module_app_infrastructure_repository"></a> [app\_infrastructure\_repository](#module\_app\_infrastructure\_repository) | app.terraform.io/cxtfcloud/repository/github | ~> 1.4.0 |
| <a name="module_app_infrastructure_repository_files"></a> [app\_infrastructure\_repository\_files](#module\_app\_infrastructure\_repository\_files) | app.terraform.io/cxtfcloud/repository-files/github//modules/aws-application-infrastructure | ~> 1.9.0 |
| <a name="module_base_infra"></a> [base\_infra](#module\_base\_infra) | app.terraform.io/cxtfcloud/single-workspace-deployment/tfe | ~> 2.2.0 |
| <a name="module_base_infrastructure_repository"></a> [base\_infrastructure\_repository](#module\_base\_infrastructure\_repository) | app.terraform.io/cxtfcloud/repository/github | ~> 1.4.0 |
| <a name="module_base_infrastructure_repository_files"></a> [base\_infrastructure\_repository\_files](#module\_base\_infrastructure\_repository\_files) | app.terraform.io/cxtfcloud/repository-files/github//modules/aws-base-infrastructure | ~> 1.9.0 |
| <a name="module_cloud_account"></a> [cloud\_account](#module\_cloud\_account) | app.terraform.io/cxtfcloud/single-workspace-deployment/tfe | ~> 2.2.0 |
| <a name="module_cloud_account_repository"></a> [cloud\_account\_repository](#module\_cloud\_account\_repository) | app.terraform.io/cxtfcloud/repository/github | ~> 1.4.0 |
| <a name="module_cloud_account_repository_files"></a> [cloud\_account\_repository\_files](#module\_cloud\_account\_repository\_files) | app.terraform.io/cxtfcloud/repository-files/github//modules/runon-cloud-account | ~> 1.9.0 |

## Resources

| Name | Type |
|------|------|
| [tfe_oauth_client.client](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/oauth_client) | data source |
| [tfe_outputs.agent_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |
| [tfe_outputs.organization](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_deployments"></a> [app\_deployments](#input\_app\_deployments) | A map of environments to regions and env specific inputs, and a list of workloads to use this region/lifecycle configuration | <pre>object({<br>    lifecycle_region_config = map(map(object({<br>      terraform_version = optional(string, "~> 1.3.0")<br>      auto_applies      = optional(bool, false)<br>    })))<br>    workloads = list(string)<br>  })</pre> | <pre>{<br>  "lifecycle_region_config": {<br>    "dev": {<br>      "us-west-2": {<br>        "auto_applies": true<br>      }<br>    },<br>    "perf": {<br>      "ap-southeast-2": {},<br>      "eu-central-1": {},<br>      "us-west-2": {}<br>    },<br>    "stage": {<br>      "us-west-2": {}<br>    },<br>    "test": {<br>      "us-west-2": {}<br>    }<br>  },<br>  "workloads": [<br>    "px-core",<br>    "cxpp-hcaas-ms",<br>    "cxpp-user-management",<br>    "cxpp-user-management-scheduler",<br>    "cxpp-training-enablement",<br>    "cxpp-database",<br>    "cxpp-partner-info",<br>    "cxpp-partner-info-scheduler",<br>    "cxpp-portal-support"<br>,<br>    "cxpp-customer-portal-mirror"<br>,<br>    "cxpp-portal-feedback"<br>   ]<br>}</pre> | no |
| <a name="input_app_infra_deployments"></a> [app\_infra\_deployments](#input\_app\_infra\_deployments) | app-infra workspaces to create | <pre>list(object({<br>    environment = optional(string, "dev")<br>    region      = optional(string, "us-west-2")<br>  }))</pre> | <pre>[<br>  {<br>    "environment": "dev",<br>    "region": "us-west-2"<br>  },<br>  {<br>    "environment": "test",<br>    "region": "us-west-2"<br>  },<br>  {<br>    "environment": "stage",<br>    "region": "us-west-2"<br>  },<br>  {<br>    "environment": "perf",<br>    "region": "us-west-2"<br>  },<br>  {<br>    "environment": "perf",<br>    "region": "eu-central-1"<br>  },<br>  {<br>    "environment": "perf",<br>    "region": "ap-southeast-2"<br>  },<br>  {<br>    "environment": "prod",<br>    "region": "us-west-2"<br>  },<br>  {<br>    "environment": "prod",<br>    "region": "eu-central-1"<br>  },<br>  {<br>    "environment": "prod",<br>    "region": "ap-southeast-2"<br>  }<br>]</pre> | no |
| <a name="input_app_infra_repo_config"></a> [app\_infra\_repo\_config](#input\_app\_infra\_repo\_config) | Configuration for the app infrastructure GitHub repository | <pre>object({<br>    admin_collaborators    = optional(list(string), [])<br>    pull_collaborators     = optional(list(string), [])<br>    push_collaborators     = optional(list(string), [])<br>    admin_teams            = optional(list(string), ["sg1-admins", "px-cloud-admin", "px-cloud", "sg1-release-px-core", ])<br>    pull_teams             = optional(list(string), [])<br>    push_teams             = optional(list(string), ["cisco-blue", ])<br>    has_wiki               = optional(bool, true)<br>    archive_on_destroy     = optional(bool, true)<br>    delete_branch_on_merge = optional(bool, true)<br>    default_branch         = optional(string, "dev")<br>    allow_merge_commit     = optional(bool, true)<br>    allow_rebase_merge     = optional(bool, false)<br>    allow_squash_merge     = optional(bool, false)<br>    merge_commit_title     = optional(string, "PR_TITLE")<br>    merge_commit_message   = optional(string, "BLANK")<br>    branch_protections = optional(list(object({<br>      branch                          = string<br>      enforce_admins                  = optional(bool, false)<br>      restrictions                    = optional(map(list(string)))<br>      required_linear_history         = optional(bool, false)<br>      require_conversation_resolution = optional(bool, true)<br>      required_status_checks = optional(object({<br>        strict   = optional(bool, true)<br>        contexts = optional(list(string))<br>      }), {})<br>      required_pull_request_reviews = optional(object({<br>        required_approving_review_count = optional(number, 1)<br>        dismiss_stale_reviews           = optional(bool, true)<br>        require_code_owner_reviews      = optional(bool, true)<br>        restrict_dismissals             = optional(bool, true)<br>        pull_request_bypassers          = optional(map(list(string)))<br>      }))<br>      })), [<br>      {<br>        branch = "dev"<br>        required_status_checks = {<br>          contexts = ["build-pr"]<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "test"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "stage"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "perf"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "prod"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>    ])<br>  })</pre> | `{}` | no |
| <a name="input_app_infra_workspace"></a> [app\_infra\_workspace](#input\_app\_infra\_workspace) | The application infrastructure Terraform Cloud settings | <pre>object({<br>    global_remote_state = optional(bool, false)<br>    execution_mode      = optional(string, "agent")<br>    terraform_version   = optional(string, "~> 1.3.0")<br>  })</pre> | `{}` | no |
| <a name="input_base_infra_deployments"></a> [base\_infra\_deployments](#input\_base\_infra\_deployments) | base-infra workspaces to create | `any` | <pre>[<br>  {<br>    "environment": "dev",<br>    "region": "us-west-2",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.98.64.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  },<br>  {<br>    "environment": "nprd",<br>    "region": "us-west-2",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.98.72.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  },<br>  {<br>    "environment": "nprd",<br>    "region": "eu-central-1",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.98.80.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  },<br>  {<br>    "environment": "nprd",<br>    "region": "ap-southeast-2",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.98.88.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  },<br>  {<br>    "environment": "prod",<br>    "region": "us-west-2",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.113.112.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  },<br>  {<br>    "environment": "prod",<br>    "region": "eu-central-1",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.113.120.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  },<br>  {<br>    "environment": "prod",<br>    "region": "ap-southeast-2",<br>    "transit_gateway": {<br>      "create_tgw": false,<br>      "gateway_id": "",<br>      "name": "",<br>      "remote_state": true,<br>      "route_table_id": "",<br>      "share_tgw": false,<br>      "vpc_attachments": {}<br>    },<br>    "umbrella_dns": {<br>      "enable": true,<br>      "kms_key_account": "",<br>      "kms_key_id": "",<br>      "remote_state": true,<br>      "resolver_rules": [],<br>      "retention": 0,<br>      "tags": {}<br>    },<br>    "vpc": {<br>      "cidr": "10.113.128.0/21",<br>      "default_security_group_egress": [],<br>      "default_security_group_ingress": [],<br>      "enable": true,<br>      "enable_dns_hostnames": true,<br>      "enable_dns_support": true,<br>      "enable_nat_gateway": false,<br>      "gateway_endpoints": [],<br>      "interface_endpoints": [],<br>      "intra_subnets": {<br>        "cidr": "28",<br>        "count": 0<br>      },<br>      "manage_default_security_group": true,<br>      "one_nat_gateway_per_az": false,<br>      "private_subnets": {<br>        "cidr": "23",<br>        "count": 3<br>      },<br>      "single_nat_gateway": false<br>    }<br>  }<br>]</pre> | no |
| <a name="input_base_infra_repo_config"></a> [base\_infra\_repo\_config](#input\_base\_infra\_repo\_config) | Configuration for the base infrastructure GitHub repository | <pre>object({<br>    admin_collaborators    = optional(list(string), [])<br>    pull_collaborators     = optional(list(string), [])<br>    push_collaborators     = optional(list(string), [])<br>    admin_teams            = optional(list(string), ["sg1-pam", ])<br>    pull_teams             = optional(list(string), [])<br>    push_teams             = optional(list(string), ["cisco-blue", "sg1-admins", "px-cloud-admin", "px-cloud", "sg1-release-px-core", ])<br>    has_wiki               = optional(bool, true)<br>    archive_on_destroy     = optional(bool, true)<br>    delete_branch_on_merge = optional(bool, true)<br>    default_branch         = optional(string, "dev")<br>    allow_merge_commit     = optional(bool, true)<br>    allow_rebase_merge     = optional(bool, false)<br>    allow_squash_merge     = optional(bool, false)<br>    merge_commit_title     = optional(string, "PR_TITLE")<br>    merge_commit_message   = optional(string, "BLANK")<br>    branch_protections = optional(list(object({<br>      branch                          = string<br>      enforce_admins                  = optional(bool, false)<br>      restrictions                    = optional(map(list(string)))<br>      required_linear_history         = optional(bool, false)<br>      require_conversation_resolution = optional(bool, true)<br>      required_status_checks = optional(object({<br>        strict   = optional(bool, true)<br>        contexts = optional(list(string))<br>      }), {})<br>      required_pull_request_reviews = optional(object({<br>        required_approving_review_count = optional(number, 1)<br>        dismiss_stale_reviews           = optional(bool, true)<br>        require_code_owner_reviews      = optional(bool, true)<br>        restrict_dismissals             = optional(bool, true)<br>        pull_request_bypassers          = optional(map(list(string)))<br>      }))<br>      })), [<br>      {<br>        branch = "dev"<br>        required_status_checks = {<br>          contexts = ["build-pr"]<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "nprd"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "prod"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>    ])<br>  })</pre> | `{}` | no |
| <a name="input_base_infra_workspace"></a> [base\_infra\_workspace](#input\_base\_infra\_workspace) | The base infrastructure Terraform Cloud settings | <pre>object({<br>    global_remote_state = optional(bool, false)<br>    execution_mode      = optional(string, "agent")<br>    terraform_version   = optional(string, "~> 1.3.0")<br>  })</pre> | `{}` | no |
| <a name="input_cloud_account_deployments"></a> [cloud\_account\_deployments](#input\_cloud\_account\_deployments) | cloud account workspaces to create | `any` | <pre>{<br>  "dev": {<br>    "business_application_name": "CX Cloud",<br>    "business_contact": "",<br>    "data_classification": "Confidential",<br>    "email": "px-core-dev@cisco.com",<br>    "environment": "dev",<br>    "estimated_cost": "2707",<br>    "security_contact": "",<br>    "technical_contact": ""<br>  },<br>  "nprd": {<br>    "business_application_name": "CX Cloud",<br>    "business_contact": "",<br>    "data_classification": "Confidential",<br>    "email": "px-core-nprd@cisco.com",<br>    "environment": "nprd",<br>    "estimated_cost": "13533",<br>    "security_contact": "",<br>    "technical_contact": ""<br>  },<br>  "prod": {<br>    "business_application_name": "CX Cloud",<br>    "business_contact": "",<br>    "data_classification": "Confidential",<br>    "email": "px-core-prod@cisco.com",<br>    "environment": "prod",<br>    "estimated_cost": "11547",<br>    "security_contact": "",<br>    "technical_contact": ""<br>  }<br>}</pre> | no |
| <a name="input_cloud_account_repo_config"></a> [cloud\_account\_repo\_config](#input\_cloud\_account\_repo\_config) | Configuration for the cloud account GitHub repository | <pre>object({<br>    admin_collaborators    = optional(list(string), [])<br>    pull_collaborators     = optional(list(string), [])<br>    push_collaborators     = optional(list(string), [])<br>    pull_teams             = optional(list(string), [])<br>    has_wiki               = optional(bool, true)<br>    archive_on_destroy     = optional(bool, true)<br>    delete_branch_on_merge = optional(bool, true)<br>    default_branch         = optional(string, "dev")<br>    allow_merge_commit     = optional(bool, true)<br>    allow_rebase_merge     = optional(bool, false)<br>    allow_squash_merge     = optional(bool, false)<br>    merge_commit_title     = optional(string, "PR_TITLE")<br>    merge_commit_message   = optional(string, "BLANK")<br>    branch_protections = optional(list(object({<br>      branch                          = string<br>      enforce_admins                  = optional(bool, false)<br>      restrictions                    = optional(map(list(string)))<br>      required_linear_history         = optional(bool, false)<br>      require_conversation_resolution = optional(bool, true)<br>      required_status_checks = optional(object({<br>        strict   = optional(bool, true)<br>        contexts = optional(list(string), [])<br>      }))<br>      required_pull_request_reviews = optional(object({<br>        required_approving_review_count = optional(number, 1)<br>        dismiss_stale_reviews           = optional(bool, true)<br>        require_code_owner_reviews      = optional(bool, true)<br>        restrict_dismissals             = optional(bool, true)<br>        pull_request_bypassers          = optional(map(list(string)))<br>      }))<br>      })), [<br>      {<br>        branch = "dev"<br>        required_status_checks = {<br>          contexts = ["build-pr"]<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "nprd"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>      {<br>        branch = "prod"<br>        required_status_checks = {<br>          contexts = []<br>        }<br>        required_pull_request_reviews = {<br>          pull_request_bypassers = {<br>            users = ["swtg-robot-gen"]<br>          }<br>        }<br>        restrictions = {<br>          users = ["swtg-robot-gen"]<br>        }<br>      },<br>    ])<br>  })</pre> | `{}` | no |
| <a name="input_cloud_account_workspace"></a> [cloud\_account\_workspace](#input\_cloud\_account\_workspace) | The cloud account infrastructure Terraform Cloud settings | <pre>object({<br>    global_remote_state = optional(bool, false)<br>    execution_mode      = optional(string, "agent")<br>    terraform_version   = optional(string, "~> 1.3.0")<br>  })</pre> | `{}` | no |
| <a name="input_data_classification"></a> [data\_classification](#input\_data\_classification) | The Cisco data classification for the service. | `string` | `"Highly Confidential"` | no |
| <a name="input_data_taxonomy"></a> [data\_taxonomy](#input\_data\_taxonomy) | The Cisco data taxonomy. This can be defined viewed at https://dataadvisor.cloudapps.cisco.com/da/categories | `string` | `"Administrative"` | no |
| <a name="input_department_code"></a> [department\_code](#input\_department\_code) | The department which manages the service. | `string` | `"541437456-CXEPI-EP-CSE-OPEX-Poland"` | no |
| <a name="input_map_migrated"></a> [map\_migrated](#input\_map\_migrated) | The portal for which a resource is first provisioned. | `string` | `"NA"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the workload | `string` | `"px-core"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The name of the Terraform Cloud organization. | `string` | `"cxtfcloud"` | no |
| <a name="input_owner_mail_alias"></a> [owner\_mail\_alias](#input\_owner\_mail\_alias) | The support team email address for the group managing the service. | `string` | `"partner-portal-dev-team@cisco.com"` | no |
| <a name="input_partition"></a> [partition](#input\_partition) | The AWS partition being deployed to. This is either aws or aws-us-gov (does not currently support aws-cn) | `string` | `"aws"` | no |
| <a name="input_portal_name"></a> [portal\_name](#input\_portal\_name) | The portal for which a resource is first provisioned. | `string` | `"cx"` | no |
| <a name="input_remote_state_config"></a> [remote\_state\_config](#input\_remote\_state\_config) | Leveraging remote state for the organization | <pre>object({<br>    enable                 = optional(bool, true)<br>    services_workspace     = optional(string, "service-configurations")<br>    organization_workspace = optional(string, "organization-configuration")<br>    organization           = optional(string, "cxtfcloud")<br>  })</pre> | `{}` | no |
| <a name="input_resource_owner_mail_alias"></a> [resource\_owner\_mail\_alias](#input\_resource\_owner\_mail\_alias) | The specific email address for the group which owns the service. | `string` | `"partner-portal-dev-team@cisco.com"` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | The list of teams to manage the px-core Terraform Cloud workspaces | <pre>list(object({<br>    name        = string<br>    access      = optional(string)<br>    permissions = optional(map(string), {})<br>  }))</pre> | `[]` | no |
| <a name="input_terraform_cloud_base_aws_access_key_id"></a> [terraform\_cloud\_base\_aws\_access\_key\_id](#input\_terraform\_cloud\_base\_aws\_access\_key\_id) | The AWS\_ACCESS\_KEY\_ID for TerraformCloud\_base. | `string` | `""` | no |
| <a name="input_terraform_cloud_base_aws_secret_access_key"></a> [terraform\_cloud\_base\_aws\_secret\_access\_key](#input\_terraform\_cloud\_base\_aws\_secret\_access\_key) | The AWS\_SECRET\_ACCESS\_KEY for TerraformCloud\_base. | `string` | `""` | no |
| <a name="input_terraform_cloud_sg1_aws_access_key_id"></a> [terraform\_cloud\_sg1\_aws\_access\_key\_id](#input\_terraform\_cloud\_sg1\_aws\_access\_key\_id) | The AWS\_ACCESS\_KEY\_ID for TerraformCloud\_sg1. | `string` | `""` | no |
| <a name="input_terraform_cloud_sg1_aws_secret_access_key"></a> [terraform\_cloud\_sg1\_aws\_secret\_access\_key](#input\_terraform\_cloud\_sg1\_aws\_secret\_access\_key) | The AWS\_SECRET\_ACCESS\_KEY for TerraformCloud\_sg1. | `string` | `""` | no |
| <a name="input_tile_application"></a> [tile\_application](#input\_tile\_application) | The tile application which the service belongs to. | `string` | `"px-core"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_infrastructure_workspace_ids"></a> [app\_infrastructure\_workspace\_ids](#output\_app\_infrastructure\_workspace\_ids) | A map of the app infrastructure workspace IDs based on workspace name |
| <a name="output_base_infrastructure_workspace_ids"></a> [base\_infrastructure\_workspace\_ids](#output\_base\_infrastructure\_workspace\_ids) | A map of the base infrastructure workspace IDs based on workspace name |
| <a name="output_cloud_account_workspace_ids"></a> [cloud\_account\_workspace\_ids](#output\_cloud\_account\_workspace\_ids) | A map of the cloud account workspace IDs based on workspace name |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the Terraform cloud organization this workspace resides in |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
