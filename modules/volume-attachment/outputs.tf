output "attachment_id" {
  description = "ID of the volume attachment."
  value       = try(hcloud_volume_attachment.this[0].id, null)
}

output "attachment" {
  description = "Volume attachment attributes."
  value = try({
    id        = hcloud_volume_attachment.this[0].id
    server_id = hcloud_volume_attachment.this[0].server_id
    volume_id = hcloud_volume_attachment.this[0].volume_id
    automount = hcloud_volume_attachment.this[0].automount
  }, null)
}
