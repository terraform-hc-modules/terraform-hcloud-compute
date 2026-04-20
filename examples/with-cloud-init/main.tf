provider "hcloud" {}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-hcloud-compute"
    GithubOrg  = "terraform-hc-modules"
  }

  cloud_init = <<-EOT
    #cloud-config
    package_update: true
    package_upgrade: true
    packages:
      - docker.io
      - docker-compose
    runcmd:
      - systemctl enable docker
      - systemctl start docker
      - usermod -aG docker ubuntu
  EOT
}

################################################################################
# Compute Module - With Cloud-Init
################################################################################

module "compute" {
  source = "../../"

  name        = local.name
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"
  labels      = local.tags

  user_data = local.cloud_init

  create_ssh_key = true
  public_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... example"

  create_volume = true
  volume_size   = 50
  volume_format = "ext4"
}

output "server_id" {
  description = "ID of the server"
  value       = module.compute.server_id
}

output "ipv4_address" {
  description = "Public IPv4 address"
  value       = module.compute.ipv4_address
}
