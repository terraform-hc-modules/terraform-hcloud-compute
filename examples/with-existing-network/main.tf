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
# Supporting Resources - Existing Network
################################################################################

module "network" {
  source  = "terraform-hc-modules/network/hcloud//modules/vpc"
  version = "~> 0.1"

  name     = local.name
  ip_range = "10.0.0.0/16"
  labels   = local.tags

  subnets = [{
    ip_range     = "10.0.1.0/24"
    network_zone = "eu-central"
  }]
}

################################################################################
# Compute Module - Server in Existing Network
################################################################################

module "compute" {
  source = "../../"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags

  network_id = module.network.network_id
  network_ip = "10.0.1.10"

  create_ssh_key = true
  public_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... example"
}
