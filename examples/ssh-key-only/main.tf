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
# Compute Module - SSH Key Only
################################################################################

module "compute" {
  source = "../../"

  name   = local.name
  labels = local.tags

  create_server  = false
  create_ssh_key = true

  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFakePublicKeyForDocsOnly user@example"
}
