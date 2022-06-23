# Terraform Run Triggers (Azure)

Terraform [Run Triggers](https://www.terraform.io/cloud-docs/workspaces/settings/run-triggers) are a way to connect a child workspace to one or more source (root) workspaces. Run Triggers allow runs to queue automatically in your child workspace(s) on successful apply of runs in any of the source workspaces. 

This example repo aims to simulate Run Triggers in an Azure environment.
- `source-workspace` creates an Azure Service Principal for [authentication](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret) and outputs details
    - Outputs are marked as 'sensitive' to prevent plaintext storage in Terraform state
- `child-workspace` calls this newly created SP via the [Remote State Data Source](https://www.terraform.io/language/state/remote-state-data), authenticates to Azure, and creates resources (a simple resource group)

## Important Notes

- This example can be modified to provision multiple SPs using for_each for multi-tenant deployments.
- The SP created by `source-workspace` must have specific permissions (you can use 'Owner' for testing purposes)
    * Contributor <b>and</b> one of the following sets:
        * AppRoleAssignment.ReadWrite.All and Application.Read.All; or
        * AppRoleAssignment.ReadWrite.All and Directory.Read.All; or
        * Application.ReadWrite.All; or
        * Directory.ReadWrite.All

## Usage

1. Clone or fork this repo
1. Set org name in backend.tf in each workspace directory and in remote_state.tf in `child-workspace`
1. Commit changes (if using Version Control workflow) or save changes (if using CLI-driven workflow)
1. Create two workspaces in TFC/E:
    - az-srcwksp
    - az-chwksp
1. If using VC workflow, be sure to specify the path for each workspace
    - Ex. /source-workspace/ for az-srcwksp
1. Add 'src-wksp' to 'ch-wksp' as a source workspace via instructions [here](https://www.terraform.io/cloud-docs/workspaces/settings/run-triggers#creating-a-run-trigger)
1. Authenticate to Azure
1. Perform a successful run on the source workspace
    - once complete, a plan will automatically run on the child workspace

## Other Resources

[HashiCorp Learn - Run Triggers](https://learn.hashicorp.com/tutorials/terraform/cloud-run-triggers)

[Remote State Data Source](https://www.terraform.io/language/state/remote-state-data)

[Cross-Workspace State Access](https://www.terraform.io/cloud-docs/workspaces/state)

[Workspace Permissions](https://www.terraform.io/cloud-docs/users-teams-organizations/permissions)
