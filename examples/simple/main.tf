provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-compute"
    GithubOrg  = "terraform-hc-modules"
  }
}

################################################################################
# Compute Module - Simple Server
################################################################################

module "compute" {
  source = "../../"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags
}

output "server_id" {
  description = "ID of the server"
  value       = module.compute.server_id
}

output "ipv4_address" {
  description = "Public IPv4 address"
  value       = module.compute.ipv4_address
}
