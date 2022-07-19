terraform {
  cloud {
    organization = "jaware-hc-demos"

    workspaces {
      name = "az-srcwksp"
    }
  }
}