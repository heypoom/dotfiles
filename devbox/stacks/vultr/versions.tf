terraform {
  required_version = ">= 1.5"

  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.33"
    }
  }
}

# Auth: export VULTR_API_KEY. Allowlist your IP under Account > API.
provider "vultr" {}
