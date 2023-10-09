locals {
  app_lifecycle_to_env_map = {
    "dev"   = "dev"
    "test"  = "nprd"
    "stage" = "nprd"
    "perf"  = "nprd"
    "nprd"  = "nprd"
    "prod"  = "prod"
  }

  accounts = {
    dev  = "0000000000",
    nprd = "1111111111",
  }

  map_to_nprd = [
    "test",
    "stage",
    "perf",
  ]
  tfc_base_aws_creds = [
    {
      key         = "AWS_ACCESS_KEY_ID"
      value       = var.remote_state_config.enable ? nonsensitive(one(data.tfe_outputs.organization[*].values.terraform_cloud_base_aws_creds.aws_access_key)) : var.terraform_cloud_base_aws_access_key_id
      category    = "env"
      description = "AWS access key ID to store in this workspace for authentication"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "AWS_SECRET_ACCESS_KEY"
      value       = var.remote_state_config.enable ? nonsensitive(one(data.tfe_outputs.organization[*].values.terraform_cloud_base_aws_creds.aws_secret_key)) : var.terraform_cloud_base_aws_secret_access_key
      category    = "env"
      description = "AWS secret access key to store in this workspace for authentication"
      hcl         = false
      sensitive   = true
    },
  ]

  tfc_sg1_aws_creds = [
    {
      key         = "AWS_ACCESS_KEY_ID"
      value       = var.remote_state_config.enable ? nonsensitive(one(data.tfe_outputs.organization[*].values.terraform_cloud_sg1_aws_creds.aws_access_key)) : var.terraform_cloud_sg1_aws_access_key_id
      category    = "env"
      description = "AWS access key ID to store in this workspace for authentication"
      hcl         = false
      sensitive   = false
    },
    {
      key         = "AWS_SECRET_ACCESS_KEY"
      value       = var.remote_state_config.enable ? nonsensitive(one(data.tfe_outputs.organization[*].values.terraform_cloud_sg1_aws_creds.aws_secret_key)) : var.terraform_cloud_sg1_aws_secret_access_key
      category    = "env"
      description = "AWS secret access key to store in this workspace for authentication"
      hcl         = false
      sensitive   = true
    },
  ]
}
