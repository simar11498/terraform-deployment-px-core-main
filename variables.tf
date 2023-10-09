variable "name" {
  description = "The name of the workload"
  type        = string
  default     = "px-core"
}

variable "organization" {
  description = "The name of the Terraform Cloud organization."
  type        = string
  default     = "cxtfcloud"
}

variable "remote_state_config" {
  description = "Leveraging remote state for the organization"
  type = object({
    enable                 = optional(bool, true)
    services_workspace     = optional(string, "service-configurations")
    organization_workspace = optional(string, "organization-configuration")
    organization           = optional(string, "cxtfcloud")
  })
  default = {}
}

variable "portal_name" {
  description = "The portal for which a resource is first provisioned."
  type        = string
  default     = "cx"

  validation {
    condition     = contains(["cx", "px", "trust"], var.portal_name)
    error_message = "The portal_name must be either cx, px, or trust."
  }
}

variable "tile_application" {
  description = "The tile application which the service belongs to."
  type        = string
  default     = "px-core"
}

variable "owner_mail_alias" {
  description = "The support team email address for the group managing the service."
  type        = string
  default     = "partner-portal-dev-team@cisco.com"

  validation {
    condition     = can(regex("^\\S+@\\S+$", var.owner_mail_alias))
    error_message = "The owner mail alias must be a valid Cisco email address."
  }
}

variable "resource_owner_mail_alias" {
  description = "The specific email address for the group which owns the service."
  type        = string
  default     = "partner-portal-dev-team@cisco.com"

  validation {
    condition     = can(regex("^\\S+@\\S+$", var.resource_owner_mail_alias))
    error_message = "The resource owner mail alias must be a valid Cisco email address."
  }
}

variable "department_code" {
  description = "The department which manages the service."
  type        = string
  default     = "541437456-CXEPI-EP-CSE-OPEX-Poland"
}

variable "data_classification" {
  description = "The Cisco data classification for the service."
  type        = string
  default     = "Highly Confidential"

  validation {
    condition     = contains(["Public", "Confidential", "Highly Confidential", "Restricted"], var.data_classification)
    error_message = "The data classifcation must be either Public, Confidential, Highly Confidential, or Restriced."
  }
}

variable "data_taxonomy" {
  description = "The Cisco data taxonomy. This can be defined viewed at https://dataadvisor.cloudapps.cisco.com/da/categories"
  type        = string
  default     = "Administrative"

  validation {
    condition     = contains(["Administrative", "Cisco Operations", "Cisco Strategic", "Customer", "Entrusted", "Financing", "Human Resources", "Support", "Telemetry"], var.data_taxonomy)
    error_message = "The data taxonomy must be either Administrative, Cisco Operations, Cisco Strategic, Customer, Entrusted, Financing, Human Resources, Support, or Telemetry."
  }
}

variable "map_migrated" {
  description = "The portal for which a resource is first provisioned."
  type        = string
  default     = "NA"
}

variable "partition" {
  description = "The AWS partition being deployed to. This is either aws or aws-us-gov (does not currently support aws-cn)"
  type        = string
  default     = "aws"

  validation {
    condition     = contains(["aws", "aws-us-gov"], var.partition)
    error_message = "Partition must be either aws or aws-us-gov."
  }
}

variable "teams" {
  description = "The list of teams to manage the px-core Terraform Cloud workspaces"
  type = list(object({
    name        = string
    access      = optional(string)
    permissions = optional(map(string), {})
  }))
  default = []
}

variable "terraform_cloud_base_aws_access_key_id" {
  description = "The AWS_ACCESS_KEY_ID for TerraformCloud_base."
  type        = string
  default     = ""
}

variable "terraform_cloud_base_aws_secret_access_key" {
  description = "The AWS_SECRET_ACCESS_KEY for TerraformCloud_base."
  type        = string
  default     = ""
}

variable "terraform_cloud_sg1_aws_access_key_id" {
  description = "The AWS_ACCESS_KEY_ID for TerraformCloud_sg1."
  type        = string
  default     = ""
}

variable "terraform_cloud_sg1_aws_secret_access_key" {
  description = "The AWS_SECRET_ACCESS_KEY for TerraformCloud_sg1."
  type        = string
  default     = ""
}

variable "app_infra_workspace" {
  description = "The application infrastructure Terraform Cloud settings"
  type = object({
    global_remote_state = optional(bool, false)
    execution_mode      = optional(string, "agent")
    terraform_version   = optional(string, "~> 1.3.0")
  })
  default = {}
}

variable "app_infra_repo_config" {
  description = "Configuration for the app infrastructure GitHub repository"
  type = object({
    admin_collaborators    = optional(list(string), [])
    pull_collaborators     = optional(list(string), [])
    push_collaborators     = optional(list(string), [])
    admin_teams            = optional(list(string), ["sg1-admins", "px-cloud-admin", "px-cloud", "sg1-release-px-core", ])
    pull_teams             = optional(list(string), [])
    push_teams             = optional(list(string), ["cisco-blue", ])
    has_wiki               = optional(bool, true)
    archive_on_destroy     = optional(bool, true)
    delete_branch_on_merge = optional(bool, true)
    default_branch         = optional(string, "dev")
    allow_merge_commit     = optional(bool, true)
    allow_rebase_merge     = optional(bool, false)
    allow_squash_merge     = optional(bool, false)
    merge_commit_title     = optional(string, "PR_TITLE")
    merge_commit_message   = optional(string, "BLANK")
    branch_protections = optional(list(object({
      branch                          = string
      enforce_admins                  = optional(bool, false)
      restrictions                    = optional(map(list(string)))
      required_linear_history         = optional(bool, false)
      require_conversation_resolution = optional(bool, true)
      required_status_checks = optional(object({
        strict   = optional(bool, true)
        contexts = optional(list(string))
      }), {})
      required_pull_request_reviews = optional(object({
        required_approving_review_count = optional(number, 1)
        dismiss_stale_reviews           = optional(bool, true)
        require_code_owner_reviews      = optional(bool, true)
        restrict_dismissals             = optional(bool, true)
        pull_request_bypassers          = optional(map(list(string)))
      }))
      })), [
      {
        branch = "dev"
        required_status_checks = {
          contexts = ["build-pr"]
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "test"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "stage"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "perf"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "prod"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
    ])
  })
  default = {}
}

variable "base_infra_workspace" {
  description = "The base infrastructure Terraform Cloud settings"
  type = object({
    global_remote_state = optional(bool, false)
    execution_mode      = optional(string, "agent")
    terraform_version   = optional(string, "~> 1.3.0")
  })
  default = {}
}

variable "base_infra_repo_config" {
  description = "Configuration for the base infrastructure GitHub repository"
  type = object({
    admin_collaborators    = optional(list(string), [])
    pull_collaborators     = optional(list(string), [])
    push_collaborators     = optional(list(string), [])
    admin_teams            = optional(list(string), ["sg1-pam", ])
    pull_teams             = optional(list(string), [])
    push_teams             = optional(list(string), ["cisco-blue", "sg1-admins", "px-cloud-admin", "px-cloud", "sg1-release-px-core", ])
    has_wiki               = optional(bool, true)
    archive_on_destroy     = optional(bool, true)
    delete_branch_on_merge = optional(bool, true)
    default_branch         = optional(string, "dev")
    allow_merge_commit     = optional(bool, true)
    allow_rebase_merge     = optional(bool, false)
    allow_squash_merge     = optional(bool, false)
    merge_commit_title     = optional(string, "PR_TITLE")
    merge_commit_message   = optional(string, "BLANK")
    branch_protections = optional(list(object({
      branch                          = string
      enforce_admins                  = optional(bool, false)
      restrictions                    = optional(map(list(string)))
      required_linear_history         = optional(bool, false)
      require_conversation_resolution = optional(bool, true)
      required_status_checks = optional(object({
        strict   = optional(bool, true)
        contexts = optional(list(string))
      }), {})
      required_pull_request_reviews = optional(object({
        required_approving_review_count = optional(number, 1)
        dismiss_stale_reviews           = optional(bool, true)
        require_code_owner_reviews      = optional(bool, true)
        restrict_dismissals             = optional(bool, true)
        pull_request_bypassers          = optional(map(list(string)))
      }))
      })), [
      {
        branch = "dev"
        required_status_checks = {
          contexts = ["build-pr"]
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "nprd"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "prod"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
    ])
  })
  default = {}
}

variable "cloud_account_workspace" {
  description = "The cloud account infrastructure Terraform Cloud settings"
  type = object({
    global_remote_state = optional(bool, false)
    execution_mode      = optional(string, "agent")
    terraform_version   = optional(string, "~> 1.3.0")
  })
  default = {}
}

variable "cloud_account_repo_config" {
  description = "Configuration for the cloud account GitHub repository"
  type = object({
    admin_collaborators    = optional(list(string), [])
    pull_collaborators     = optional(list(string), [])
    push_collaborators     = optional(list(string), [])
    pull_teams             = optional(list(string), [])
    has_wiki               = optional(bool, true)
    archive_on_destroy     = optional(bool, true)
    delete_branch_on_merge = optional(bool, true)
    default_branch         = optional(string, "dev")
    allow_merge_commit     = optional(bool, true)
    allow_rebase_merge     = optional(bool, false)
    allow_squash_merge     = optional(bool, false)
    merge_commit_title     = optional(string, "PR_TITLE")
    merge_commit_message   = optional(string, "BLANK")
    branch_protections = optional(list(object({
      branch                          = string
      enforce_admins                  = optional(bool, false)
      restrictions                    = optional(map(list(string)))
      required_linear_history         = optional(bool, false)
      require_conversation_resolution = optional(bool, true)
      required_status_checks = optional(object({
        strict   = optional(bool, true)
        contexts = optional(list(string), [])
      }))
      required_pull_request_reviews = optional(object({
        required_approving_review_count = optional(number, 1)
        dismiss_stale_reviews           = optional(bool, true)
        require_code_owner_reviews      = optional(bool, true)
        restrict_dismissals             = optional(bool, true)
        pull_request_bypassers          = optional(map(list(string)))
      }))
      })), [
      {
        branch = "dev"
        required_status_checks = {
          contexts = ["build-pr"]
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "nprd"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
      {
        branch = "prod"
        required_status_checks = {
          contexts = []
        }
        required_pull_request_reviews = {
          pull_request_bypassers = {
            users = ["swtg-robot-gen"]
          }
        }
        restrictions = {
          users = ["swtg-robot-gen"]
        }
      },
    ])
  })
  default = {}
}
