terraform {
  cloud {
    organization = "jaware-hashicorp"

    workspaces {
      name = "az-srcwksp"
    }
  }
}