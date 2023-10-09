terraform {
  required_version = ">= 1.3"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.41.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.0"
    }
  }
}
