resource "hcloud_snapshot" "this" {
  count = var.create ? 1 : 0

  server_id   = var.server_id
  description = var.description
  labels      = var.labels
}
