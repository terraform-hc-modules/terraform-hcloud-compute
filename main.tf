################################################################################
# SSH Key
################################################################################

module "ssh_key" {
  source = "./modules/ssh-key"

  create = var.create_ssh_key

  name       = coalesce(var.ssh_key_name, "${var.name}-key")
  public_key = var.public_key
  labels     = var.labels
}

################################################################################
# Placement Group
################################################################################

module "placement_group" {
  source = "./modules/placement-group"

  create = var.create_placement_group

  name   = coalesce(var.placement_group_name, "${var.name}-pg")
  type   = var.placement_group_type
  labels = var.labels
}

################################################################################
# Server
################################################################################

module "server" {
  source = "./modules/server"

  create = var.create_server

  name               = var.name
  server_type        = var.server_type
  image              = var.image
  location           = var.location
  labels             = var.labels
  ssh_keys           = var.create_ssh_key ? [module.ssh_key.ssh_key_name] : var.ssh_keys
  user_data          = var.user_data
  firewall_ids       = var.firewall_ids
  placement_group_id = var.create_placement_group ? module.placement_group.placement_group_id : null
  networks           = var.networks
  backups            = var.backups
}

################################################################################
# Volume
################################################################################

module "volume" {
  source = "./modules/volume"

  create = var.create_volume

  name      = coalesce(var.volume_name, "${var.name}-volume")
  size      = var.volume_size
  location  = var.location
  labels    = var.labels
  server_id = var.create_server ? module.server.server_id : null
  automount = var.volume_automount
  format    = var.volume_format
}
