data "terraform_remote_state" "srcwksp" {
  backend = "remote"

  config = {
    organization = "jaware-hashicorp"
    workspaces = {
      name = "az-srcwksp"
    }
  }
}
