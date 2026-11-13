terraform {
  required_version = ">= 1.5"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 4.9"
    }
  }
}

# Auth: export LINODE_TOKEN.
provider "linode" {}
