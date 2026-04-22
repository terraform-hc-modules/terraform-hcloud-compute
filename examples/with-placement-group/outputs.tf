output "placement_group" {
  description = "Placement group attributes"
  value       = module.compute.placement_group
}

output "server" {
  description = "Server attributes"
  value       = module.compute.server
}
