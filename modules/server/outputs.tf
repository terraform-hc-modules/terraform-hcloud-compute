output "server_id" {
  description = "ID of the server."
  value       = try(hcloud_server.this[0].id, null)
}

output "server_name" {
  description = "Name of the server."
  value       = try(hcloud_server.this[0].name, null)
}

output "ipv4_address" {
  description = "IPv4 address of the server."
  value       = try(hcloud_server.this[0].ipv4_address, null)
}

output "ipv6_address" {
  description = "IPv6 address of the server."
  value       = try(hcloud_server.this[0].ipv6_address, null)
}

output "status" {
  description = "Status of the server."
  value       = try(hcloud_server.this[0].status, null)
}

output "network_ips" {
  description = "Map of network IPs."
  value       = { for k, v in hcloud_server_network.this : k => v.ip }
}
