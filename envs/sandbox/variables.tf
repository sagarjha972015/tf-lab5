# --- OCI credentials (set in HCP variable set) ---
variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "region" {
  type = string
}

variable "private_key" {
  type      = string
  sensitive = true
}

# --- Config ---
variable "ssh_public_key" {
  type        = string
  description = "SSH public key contents"
}

variable "compartment_name" {
  type    = string
  default = "sandbox"
}

variable "extra_tags" {
  type    = map(string)
  default = { lab = "6" }
}
