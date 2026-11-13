resource "hcloud_snapshot" "this" {
  count = var.create ? 1 : 0

  server_id   = var.server_id
  description = var.description
  labels      = var.labels

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = timeouts.value.create
    }
  }
}
