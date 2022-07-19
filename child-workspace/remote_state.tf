data "terraform_remote_state" "srcwksp" {
  backend = "remote"

  config = {
    organization = "jaware-hc-demos"
    workspaces = {
      name = "az-srcwksp"
    }
  }
}
