data "oci_identity_compartments" "sandbox" {
  compartment_id = var.tenancy_ocid
  name           = var.compartment_name
}

locals {
  compartment_id = data.oci_identity_compartments.sandbox.compartments[0].id

  tags = merge(
    {
      environment = "sandbox"
      managed_by  = "terraform"
      owner       = "platform-team"
    },
    var.extra_tags
  )
}

module "network" {
  source         = "../../modules/network"
  compartment_id = local.compartment_id
  name_prefix    = "sandbox"
  freeform_tags  = local.tags
}

module "app_vm" {
  source         = "../../modules/compute"
  compartment_id = local.compartment_id
  tenancy_ocid   = var.tenancy_ocid
  name           = "sandbox-app-01"
  subnet_id      = module.network.private_subnet_id # output -> input
  nsg_ids        = [module.network.ssh_nsg_id]
  ssh_public_key = var.ssh_public_key
  freeform_tags  = local.tags
}
