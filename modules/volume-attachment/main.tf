resource "hcloud_volume_attachment" "this" {
  count = var.create ? 1 : 0

  server_id = var.server_id
  volume_id = var.volume_id
  automount = var.automount
}
