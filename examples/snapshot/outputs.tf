output "server_id" {
  description = "ID of the server"
  value       = module.server.server_id
}

output "snapshot_id" {
  description = "ID of the snapshot"
  value       = module.snapshot.snapshot_id
}
