################################################################################
# Server
################################################################################

output "server_id" {
  description = "ID of the server."
  value       = module.server.server_id
}

output "server_name" {
  description = "Name of the server."
  value       = module.server.server_name
}

output "ipv4_address" {
  description = "IPv4 address of the server."
  value       = module.server.ipv4_address
}

output "ipv6_address" {
  description = "IPv6 address of the server."
  value       = module.server.ipv6_address
}

output "server" {
  description = "Server attributes."
  value       = module.server.server
}

output "server_network_attachments" {
  description = "Map of server network attachments keyed by index."
  value       = module.server.network_attachments
}

output "server_rdns" {
  description = "Map of server reverse DNS entries keyed by index."
  value       = module.server.rdns
}

################################################################################
# SSH Key
################################################################################

output "ssh_key_id" {
  description = "ID of the SSH key."
  value       = module.ssh_key.ssh_key_id
}

output "ssh_key_fingerprint" {
  description = "Fingerprint of the SSH key."
  value       = module.ssh_key.fingerprint
}

output "ssh_key" {
  description = "SSH key attributes."
  value       = module.ssh_key.ssh_key
}

################################################################################
# Volume
################################################################################

output "volume_id" {
  description = "ID of the volume."
  value       = module.volume.volume_id
}

output "volume_linux_device" {
  description = "Linux device path of the volume."
  value       = module.volume.linux_device
}

output "volume" {
  description = "Volume attributes."
  value       = module.volume.volume
}

################################################################################
# Placement Group
################################################################################

output "placement_group_id" {
  description = "ID of the placement group."
  value       = module.placement_group.placement_group_id
}

output "placement_group" {
  description = "Placement group attributes."
  value       = module.placement_group.placement_group
}
