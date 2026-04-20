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
# Compute Module - Server with Snapshot
################################################################################

module "compute" {
  source = "../../"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags

  # Enable backups for snapshot capability
  backups = true
}

output "server_id" {
  description = "ID of the server"
  value       = module.compute.server_id
}
