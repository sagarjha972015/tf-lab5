# oci-platform (Lab 5)

Terraform project for OCI using reusable modules and HCP Terraform (remote state/execution).

## Structure
```
oci-platform/
├── PROGRESS.md
├── README.md
├── .gitignore
├── modules/
│   ├── network/   # VCN, IGW, NAT, route tables, subnets, SSH NSG
│   └── compute/   # Instance, image lookup, AD lookup
└── envs/
    └── sandbox/   # Root config (calls modules, HCP backend, provider)
```

## Setup
1. In OCI: create user `tf-automation`, group `tf-automation-group`, policy:
   `Allow group tf-automation-group to manage all-resources in compartment sandbox`
   plus (for AD lookup, tenancy level):
   `Allow group tf-automation-group to inspect availability-domains in tenancy`
   and `Allow group tf-automation-group to inspect compartments in tenancy`
   Create an API key; keep the private key and fingerprint.
2. In HCP Terraform: create organization, project, and a CLI-driven workspace `oci-sandbox`.
3. Create a variable set (apply to project/workspace) with Terraform variables:
   `tenancy_ocid`, `user_ocid`, `fingerprint`, `region`, `private_key` (**sensitive**, paste full PEM contents), `ssh_public_key`.
4. Edit `envs/sandbox/providers.tf`: set your HCP organization name.
5. Run:
```bash
cd envs/sandbox
terraform login
terraform init            # add -migrate-state if you have local state to move
terraform plan
terraform apply
```
For local testing only, copy `terraform.tfvars.example` to `terraform.tfvars` (git-ignored). Never commit secrets.

## Practice tasks
1. Add an `extra_tags` merge to both modules.
2. Add an optional block volume to compute using `count`/`for_each`.
3. Call the network module twice with different CIDRs.
4. Pin module source to a Git tag.
