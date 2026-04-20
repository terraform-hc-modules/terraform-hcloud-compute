resource "hcloud_volume" "this" {
  count = var.create ? 1 : 0

  name              = var.name
  size              = var.size
  location          = var.server_id == null ? var.location : null
  server_id         = var.server_id
  labels            = var.labels
  automount         = var.automount
  format            = var.format
  delete_protection = var.delete_protection
}
