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

output "server" {
  description = "Server attributes."
  value = try({
    id           = hcloud_server.this[0].id
    name         = hcloud_server.this[0].name
    status       = hcloud_server.this[0].status
    server_type  = hcloud_server.this[0].server_type
    image        = hcloud_server.this[0].image
    location     = hcloud_server.this[0].location
    datacenter   = hcloud_server.this[0].datacenter
    ipv4_address = hcloud_server.this[0].ipv4_address
    ipv6_address = hcloud_server.this[0].ipv6_address
    labels       = hcloud_server.this[0].labels
    backups      = hcloud_server.this[0].backups
  }, null)
}

output "network_attachments" {
  description = "Map of server network attachments keyed by index."
  value = {
    for k, v in hcloud_server_network.this : k => {
      id         = try(v.id, null)
      network_id = v.network_id
      ip         = v.ip
      alias_ips  = v.alias_ips
    }
  }
}

output "rdns" {
  description = "Map of reverse DNS entries keyed by index."
  value = {
    for k, v in hcloud_rdns.this : k => {
      id         = try(v.id, null)
      ip_address = v.ip_address
      dns_ptr    = v.dns_ptr
    }
  }
}
