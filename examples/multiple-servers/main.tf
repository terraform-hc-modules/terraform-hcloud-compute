provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-compute"
    GithubOrg  = "terraform-hc-modules"
  }

  servers = {
    web-1 = {
      server_type = "cx22"
      location    = "fsn1"
    }
    web-2 = {
      server_type = "cx22"
      location    = "nbg1"
    }
    db-1 = {
      server_type = "cx32"
      location    = "hel1"
    }
  }
}

################################################################################
# Compute Module - Multiple Servers using Wrappers
################################################################################

module "servers" {
  source = "../../wrappers"

  items = {
    for name, config in local.servers : name => {
      name        = "${local.name}-${name}"
      server_type = config.server_type
      image       = "ubuntu-24.04"
      location    = config.location
      labels      = merge(local.tags, { Role = split("-", name)[0] })
    }
  }
}

output "server_ids" {
  description = "Map of server IDs"
  value       = { for k, v in module.servers.wrapper : k => v.server_id }
}

output "server_ips" {
  description = "Map of server public IPs"
  value       = { for k, v in module.servers.wrapper : k => v.ipv4_address }
}
