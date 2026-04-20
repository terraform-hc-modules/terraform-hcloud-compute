output "snapshot_id" {
  description = "ID of the snapshot."
  value       = try(hcloud_snapshot.this[0].id, null)
}

output "snapshot" {
  description = "Snapshot attributes."
  value = try({
    id          = hcloud_snapshot.this[0].id
    description = hcloud_snapshot.this[0].description
    labels      = hcloud_snapshot.this[0].labels
  }, null)
}
