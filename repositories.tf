module "base_infrastructure_repository" {
  source  = "app.terraform.io/cxtfcloud/repository/github"
  version = "~> 1.4.0"

  create_branches = false
  name            = lower("terraform-workspace-${var.name}-base-infra")
  description     = "The repository for managing the AWS base infrastructure for ${var.name}"
  topics          = ["sg1", "managed-by-terraform", "terraform-workspace", "aws", var.name]

  admin_collaborators    = concat(var.base_infra_repo_config.admin_collaborators, ["cx-terraform-cloud", "swtg-robot-gen"])
  push_collaborators     = var.base_infra_repo_config.push_collaborators
  pull_collaborators     = var.base_infra_repo_config.pull_collaborators
  admin_teams            = var.base_infra_repo_config.admin_teams
  push_teams             = var.base_infra_repo_config.push_teams
  pull_teams             = var.base_infra_repo_config.pull_teams
  delete_branch_on_merge = var.base_infra_repo_config.delete_branch_on_merge
  has_wiki               = var.base_infra_repo_config.has_wiki
  archive_on_destroy     = var.base_infra_repo_config.archive_on_destroy
  branch_protections     = var.base_infra_repo_config.branch_protections
  default_branch         = var.base_infra_repo_config.default_branch
  allow_merge_commit     = var.base_infra_repo_config.allow_merge_commit
  allow_rebase_merge     = var.base_infra_repo_config.allow_rebase_merge
  allow_squash_merge     = var.base_infra_repo_config.allow_squash_merge
  merge_commit_title     = var.base_infra_repo_config.merge_commit_title
  merge_commit_message   = var.base_infra_repo_config.merge_commit_message
}

module "base_infrastructure_repository_files" {
  source  = "app.terraform.io/cxtfcloud/repository-files/github//modules/aws-base-infrastructure"
  version = "~> 1.9.0"

  name            = var.name
  repository_name = module.base_infrastructure_repository.name
  default_branch  = module.base_infrastructure_repository.default_branch
  codeowners_configuration = {
    "*" = var.base_infra_repo_config.admin_teams
  }
  repository_branches = ["nprd", "prod", ]
  lead_developer      = "jkodasog"
  team_manager        = "sdhadwal"
  team_name           = "CX Cloud for Customers"
  track_name          = "px-core"
  fast_pass           = false
  circleci_params = {
    tfcloud_context_name          = "tfc-cxtfcloud-px-core"
    tfcloud_workspace_name_prefix = "px-core-base-infra"
  }
}

module "app_infrastructure_repository" {
  source  = "app.terraform.io/cxtfcloud/repository/github"
  version = "~> 1.4.0"

  create_branches = false
  name            = lower("terraform-workspace-${var.name}-app-infra")
  description     = "The repository for managing the AWS application infrastructure for ${var.name}"
  topics          = ["sg1", "managed-by-terraform", "terraform-workspace", "terraform-app-infra", "aws", var.name]

  admin_collaborators    = concat(var.app_infra_repo_config.admin_collaborators, ["cx-terraform-cloud", "swtg-robot-gen"])
  push_collaborators     = var.app_infra_repo_config.push_collaborators
  pull_collaborators     = var.app_infra_repo_config.pull_collaborators
  admin_teams            = var.app_infra_repo_config.admin_teams
  push_teams             = var.app_infra_repo_config.push_teams
  pull_teams             = var.app_infra_repo_config.pull_teams
  delete_branch_on_merge = var.app_infra_repo_config.delete_branch_on_merge
  has_wiki               = var.app_infra_repo_config.has_wiki
  archive_on_destroy     = var.app_infra_repo_config.archive_on_destroy
  branch_protections     = var.app_infra_repo_config.branch_protections
  default_branch         = var.app_infra_repo_config.default_branch
  allow_merge_commit     = var.app_infra_repo_config.allow_merge_commit
  allow_rebase_merge     = var.app_infra_repo_config.allow_rebase_merge
  allow_squash_merge     = var.app_infra_repo_config.allow_squash_merge
  merge_commit_title     = var.app_infra_repo_config.merge_commit_title
  merge_commit_message   = var.app_infra_repo_config.merge_commit_message
}

module "app_infrastructure_repository_files" {
  source  = "app.terraform.io/cxtfcloud/repository-files/github//modules/aws-application-infrastructure"
  version = "~> 1.9.0"

  name            = var.name
  repository_name = module.app_infrastructure_repository.name
  default_branch  = module.app_infrastructure_repository.default_branch
  codeowners_configuration = {
    "*" = var.app_infra_repo_config.admin_teams
  }
  repository_branches = ["perf", "prod", "stage", "test", ]
  lead_developer      = "jkodasog"
  team_manager        = "sdhadwal"
  team_name           = "CX Cloud for Customers"
  track_name          = "px-core"
  fast_pass           = false
  circleci_params = {
    tfcloud_context_name          = "tfc-cxtfcloud-px-core"
    tfcloud_workspace_name_prefix = "px-core-app-infra"
  }
}

module "cloud_account_repository" {
  source  = "app.terraform.io/cxtfcloud/repository/github"
  version = "~> 1.4.0"

  create_branches = false
  name            = lower("terraform-workspace-${var.name}-cloud-account")
  description     = "The repository for managing the AWS application infrastructure for ${var.name}"
  topics          = ["sg1", "managed-by-terraform", "terraform-workspace", "runon", var.name]

  admin_collaborators = ["cx-terraform-cloud", "swtg-robot-gen"]
  push_collaborators  = var.cloud_account_repo_config.push_collaborators
  pull_collaborators  = var.cloud_account_repo_config.pull_collaborators
  # admin and push privileges on this repo should be tightly controlled, therefore we are hard-coding them here - MPW
  admin_teams            = ["cpx-security-iam-team"]
  push_teams             = ["sg1-admins"]
  pull_teams             = var.cloud_account_repo_config.pull_teams
  delete_branch_on_merge = var.cloud_account_repo_config.delete_branch_on_merge
  has_wiki               = var.cloud_account_repo_config.has_wiki
  archive_on_destroy     = var.cloud_account_repo_config.archive_on_destroy
  branch_protections     = var.cloud_account_repo_config.branch_protections
  default_branch         = var.cloud_account_repo_config.default_branch
  allow_merge_commit     = var.cloud_account_repo_config.allow_merge_commit
  allow_rebase_merge     = var.cloud_account_repo_config.allow_rebase_merge
  allow_squash_merge     = var.cloud_account_repo_config.allow_squash_merge
  merge_commit_title     = var.cloud_account_repo_config.merge_commit_title
  merge_commit_message   = var.cloud_account_repo_config.merge_commit_message
}

module "cloud_account_repository_files" {
  source  = "app.terraform.io/cxtfcloud/repository-files/github//modules/runon-cloud-account"
  version = "~> 1.9.0"

  name            = var.name
  repository_name = module.cloud_account_repository.name
  default_branch  = module.cloud_account_repository.default_branch
  codeowners_configuration = {
    "*" = ["cpx-security-iam-team"]
  }
  repository_branches = ["nprd", "prod", ]
  lead_developer      = "jkodasog"
  team_manager        = "sdhadwal"
  team_name           = "CX Cloud for Customers"
  track_name          = "px-core"
  fast_pass           = false
}
