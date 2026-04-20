output "snapshot_id" {
  description = "ID of the snapshot."
  value       = try(hcloud_snapshot.this[0].id, null)
}
