resource "hcloud_placement_group" "this" {
  count = var.create ? 1 : 0

  name   = var.name
  type   = var.type
  labels = var.labels
}
