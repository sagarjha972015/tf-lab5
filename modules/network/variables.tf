variable "compartment_id" {
  type        = string
  description = "OCID of the compartment where network resources are created"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names, e.g. sandbox"
}

variable "vcn_cidr" {
  type    = string
  default = "10.0.0.0/16"
  validation {
    condition     = can(cidrhost(var.vcn_cidr, 0))
    error_message = "vcn_cidr must be a valid CIDR block."
  }
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
  validation {
    condition     = can(cidrhost(var.public_subnet_cidr, 0))
    error_message = "public_subnet_cidr must be a valid CIDR block."
  }
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
  validation {
    condition     = can(cidrhost(var.private_subnet_cidr, 0))
    error_message = "private_subnet_cidr must be a valid CIDR block."
  }
}

variable "freeform_tags" {
  type    = map(string)
  default = {}
}
