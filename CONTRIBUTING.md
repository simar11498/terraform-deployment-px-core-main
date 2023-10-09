## How to Contribute

1. Clone the repository
2. Create a new branch, using the JIRA ticket number in the name of the branch, so we have that association back to JIRA.
3. Add/modify/delete the appropriate code where needed. For information on the Terraform Cloud workspace settings which you can control, please consult the [single Terraform Cloud workspace deployment module](https://app.terraform.io/app/cxtfcloud/registry/modules/private/cxtfcloud/single-workspace-deployment/tfe). For information on the GitHub repository, please consult the [GitHub repository Terraform module](https://app.terraform.io/app/cxtfcloud/registry/modules/private/cxtfcloud/repository/github)

> :warning: To prevent accidental changes to production, it's recommended to separate the production workloads in files starting with `_prod.tf` than the rest. This way, you can leverage `CODEOWNERS.md` on production changes as well as clearly know if someone intends to roll out changes to those environments. This also helps in the PCL/PCR process.

5. Commit/push the change to the branch with a meaningful message.
6. In GitHub, open a pull request to the `main` branch. Detail the change and ensure that you have another team member review the changes.
7. Upon successful review, merge the new change into the branch. This *should* have triggered the `terraform apply` command to run on [the workspace](https://app.terraform.io/app/cxtfcloud/workspaces/px-core-workspace-config). Click on the link and navigate to your specific run to deploy the changes.
8. Upon a successful run, verify the deployment ran successfully.
