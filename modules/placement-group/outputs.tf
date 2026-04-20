output "placement_group_id" {
  description = "ID of the placement group."
  value       = try(hcloud_placement_group.this[0].id, null)
}

output "placement_group_name" {
  description = "Name of the placement group."
  value       = try(hcloud_placement_group.this[0].name, null)
}
