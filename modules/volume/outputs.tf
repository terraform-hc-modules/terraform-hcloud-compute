output "volume_id" {
  description = "ID of the volume."
  value       = try(hcloud_volume.this[0].id, null)
}

output "volume_name" {
  description = "Name of the volume."
  value       = try(hcloud_volume.this[0].name, null)
}

output "size" {
  description = "Size of the volume in GB."
  value       = try(hcloud_volume.this[0].size, null)
}

output "linux_device" {
  description = "Linux device path."
  value       = try(hcloud_volume.this[0].linux_device, null)
}

output "volume" {
  description = "Volume attributes."
  value = try({
    id           = hcloud_volume.this[0].id
    name         = hcloud_volume.this[0].name
    size         = hcloud_volume.this[0].size
    linux_device = hcloud_volume.this[0].linux_device
    location     = hcloud_volume.this[0].location
    labels       = hcloud_volume.this[0].labels
    format       = hcloud_volume.this[0].format
    server_id    = try(hcloud_volume.this[0].server_id, null)
  }, null)
}
