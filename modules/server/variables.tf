variable "create" {
  description = "Whether to create the server."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the server."
  type        = string
}

variable "server_type" {
  description = "Server type (e.g., cx22, cpx11)."
  type        = string
  default     = "cx22"
}

variable "image" {
  description = "Image to use for the server."
  type        = string
  default     = "ubuntu-24.04"
}

variable "location" {
  description = "Location of the server."
  type        = string
  default     = "fsn1"
}

variable "datacenter" {
  description = "Datacenter (alternative to location)."
  type        = string
  default     = null
}

variable "labels" {
  description = "Labels to apply to the server."
  type        = map(string)
  default     = {}
}

variable "ssh_keys" {
  description = "List of SSH key IDs or names."
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "Cloud-init user data."
  type        = string
  default     = null
}

variable "firewall_ids" {
  description = "List of firewall IDs to attach."
  type        = list(number)
  default     = []
}

variable "placement_group_id" {
  description = "Placement group ID."
  type        = number
  default     = null
}

variable "networks" {
  description = "List of networks to attach."
  type = list(object({
    network_id = number
    ip         = optional(string)
    alias_ips  = optional(list(string), [])
  }))
  default = []
}

variable "public_net" {
  description = "Public network configuration."
  type = object({
    ipv4_enabled = optional(bool, true)
    ipv6_enabled = optional(bool, true)
    ipv4         = optional(number)
    ipv6         = optional(number)
  })
  default = {}
}

variable "backups" {
  description = "Enable backups."
  type        = bool
  default     = false
}

variable "keep_disk" {
  description = "Keep disk on server downgrade."
  type        = bool
  default     = false
}

variable "delete_protection" {
  description = "Enable delete protection."
  type        = bool
  default     = false
}

variable "rebuild_protection" {
  description = "Enable rebuild protection."
  type        = bool
  default     = false
}

variable "allow_deprecated_images" {
  description = "Allow deprecated images."
  type        = bool
  default     = false
}

variable "shutdown_before_deletion" {
  description = "Shutdown server before deletion."
  type        = bool
  default     = false
}

variable "rdns" {
  description = "Reverse DNS entries."
  type = list(object({
    ip_address = string
    dns_ptr    = string
  }))
  default = []
}
