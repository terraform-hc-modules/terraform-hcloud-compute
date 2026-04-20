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
# Compute Module - Server with Volume
################################################################################

module "compute" {
  source = "../../"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags

  create_volume    = true
  volume_size      = 20
  volume_format    = "xfs"
  volume_automount = true
}

