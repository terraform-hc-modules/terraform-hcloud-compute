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

output "ssh_key" {
  description = "SSH key attributes."
  value = try({
    id          = hcloud_ssh_key.this[0].id
    name        = hcloud_ssh_key.this[0].name
    fingerprint = hcloud_ssh_key.this[0].fingerprint
    labels      = hcloud_ssh_key.this[0].labels
  }, null)
}
