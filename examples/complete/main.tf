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
# Compute Module - Complete
################################################################################

module "compute" {
  source = "../../"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags

  create_ssh_key = true
  public_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl example@example.com"

  create_volume    = true
  volume_size      = 20
  volume_format    = "ext4"
  volume_automount = true

  create_placement_group = true

  backups = true
}
