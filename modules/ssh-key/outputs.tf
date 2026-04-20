output "ssh_key_id" {
  description = "ID of the SSH key."
  value       = try(hcloud_ssh_key.this[0].id, null)
}

output "ssh_key_name" {
  description = "Name of the SSH key."
  value       = try(hcloud_ssh_key.this[0].name, null)
}

output "fingerprint" {
  description = "Fingerprint of the SSH key."
  value       = try(hcloud_ssh_key.this[0].fingerprint, null)
}
