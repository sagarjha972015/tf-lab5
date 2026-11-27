terraform {
  required_version = "1.5.7"

  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }

  cloud {
    
    organization = "sagjha_demo"

    workspaces {
      name = "oci-sandbox"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key # key CONTENTS, not a file path
  region       = var.region
}
