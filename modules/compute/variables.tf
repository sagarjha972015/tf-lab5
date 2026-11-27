variable "compartment_id" {
  type = string
}

variable "tenancy_ocid" {
  type        = string
  description = "Used to look up availability domains"
}

variable "name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "nsg_ids" {
  type    = list(string)
  default = []
}

variable "shape" {
  type    = string
  default = "VM.Standard.E2.1.Micro"
}

variable "ocpus" {
  type    = number
  default = 1
  validation {
    condition     = var.ocpus >= 1 && var.ocpus <= 8
    error_message = "ocpus must be between 1 and 8 in this module."
  }
}

variable "memory_in_gbs" {
  type    = number
  default = 8
}

variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key contents (not a path)"
}

variable "freeform_tags" {
  type    = map(string)
  default = {}
}
