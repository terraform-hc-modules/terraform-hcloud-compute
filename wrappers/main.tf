module "wrapper" {
  source = "../"

  for_each = var.items

  name        = try(each.value.name, each.key)
  server_type = try(each.value.server_type, "cx22")
  image       = try(each.value.image, "ubuntu-24.04")
  location    = try(each.value.location, "fsn1")
  labels      = try(each.value.labels, {})
  ssh_keys    = try(each.value.ssh_keys, [])
  user_data   = try(each.value.user_data, null)
  networks    = try(each.value.networks, [])
  backups     = try(each.value.backups, false)

  create_server = try(each.value.create_server, true)

  create_ssh_key = try(each.value.create_ssh_key, false)
  ssh_key_name   = try(each.value.ssh_key_name, null)
  public_key     = try(each.value.public_key, "")

  create_volume    = try(each.value.create_volume, false)
  volume_name      = try(each.value.volume_name, null)
  volume_size      = try(each.value.volume_size, 10)
  volume_format    = try(each.value.volume_format, null)
  volume_automount = try(each.value.volume_automount, false)

  create_placement_group = try(each.value.create_placement_group, false)
  placement_group_name   = try(each.value.placement_group_name, null)
  placement_group_type   = try(each.value.placement_group_type, "spread")
}

variable "items" {
  description = "Map of compute configurations"
  type        = any
  default     = {}
}

output "wrapper" {
  description = "Map of compute outputs"
  value       = module.wrapper
}
