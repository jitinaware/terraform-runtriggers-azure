terraform {
  cloud {
    organization = "jaware-hashicorp"

    workspaces {
      name = "az-chwksp"
    }
  }
}