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
