resource "hcloud_server" "this" {
  count = var.create ? 1 : 0

  name                     = var.name
  server_type              = var.server_type
  image                    = var.image
  location                 = var.datacenter == null ? var.location : null
  datacenter               = var.datacenter
  labels                   = var.labels
  ssh_keys                 = var.ssh_keys
  user_data                = var.user_data
  firewall_ids             = var.firewall_ids
  placement_group_id       = var.placement_group_id
  backups                  = var.backups
  keep_disk                = var.keep_disk
  delete_protection        = var.delete_protection
  rebuild_protection       = var.rebuild_protection
  allow_deprecated_images  = var.allow_deprecated_images
  shutdown_before_deletion = var.shutdown_before_deletion

  dynamic "public_net" {
    for_each = length(var.public_net) > 0 ? [var.public_net] : []
    content {
      ipv4_enabled = public_net.value.ipv4_enabled
      ipv6_enabled = public_net.value.ipv6_enabled
      ipv4         = public_net.value.ipv4
      ipv6         = public_net.value.ipv6
    }
  }

  lifecycle {
    ignore_changes = [
      ssh_keys,
      user_data,
    ]
  }
}

resource "hcloud_server_network" "this" {
  for_each = var.create ? { for idx, net in var.networks : idx => net } : {}

  server_id  = hcloud_server.this[0].id
  network_id = each.value.network_id
  ip         = each.value.ip
  alias_ips  = each.value.alias_ips
}

resource "hcloud_rdns" "this" {
  for_each = var.create ? { for idx, rdns in var.rdns : idx => rdns } : {}

  server_id  = hcloud_server.this[0].id
  ip_address = each.value.ip_address
  dns_ptr    = each.value.dns_ptr
}
