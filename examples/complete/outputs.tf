output "server_id" {
  description = "ID of the server"
  value       = module.compute.server_id
}

output "ipv4_address" {
  description = "IPv4 address"
  value       = module.compute.ipv4_address
}

output "ssh_key_id" {
  description = "SSH key ID"
  value       = module.compute.ssh_key_id
}

output "volume_id" {
  description = "Volume ID"
  value       = module.compute.volume_id
}

output "placement_group_id" {
  description = "Placement group ID"
  value       = module.compute.placement_group_id
}
