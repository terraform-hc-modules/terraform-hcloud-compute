resource "hcloud_ssh_key" "this" {
  count = var.create ? 1 : 0

  name       = var.name
  public_key = var.public_key
  labels     = var.labels
}
