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
# Server
################################################################################

module "server" {
  source = "../../modules/server"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags
}

################################################################################
# Snapshot
################################################################################

module "snapshot" {
  source = "../../modules/snapshot"

  server_id   = module.server.server_id
  description = "Snapshot of ${local.name}"
  labels      = local.tags
}
