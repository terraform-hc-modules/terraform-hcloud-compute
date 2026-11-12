variable "create" {
  description = "Whether to create the server."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the server."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The `name` value must be a non-empty string."
  }
}

variable "server_type" {
  description = "Server type (e.g., cx22, cpx11)."
  type        = string
  default     = "cx22"

  validation {
    condition     = length(trimspace(var.server_type)) > 0
    error_message = "The `server_type` value must be a non-empty string."
  }
}

variable "image" {
  description = "Image to use for the server."
  type        = string
  default     = "ubuntu-24.04"

  validation {
    condition     = length(trimspace(var.image)) > 0
    error_message = "The `image` value must be a non-empty string."
  }
}

variable "location" {
  description = "Location of the server."
  type        = string
  default     = "fsn1"

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "The `location` value must be a non-empty string."
  }
}

variable "labels" {
  description = "Labels to apply to the server."
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for k, v in var.labels : (
        length(k) > 0 &&
        length(k) <= 63 &&
        length(v) <= 63 &&
        can(regex("^[A-Za-z0-9][A-Za-z0-9_.-]{0,62}$", k))
      )
    ])
    error_message = "The `labels` map keys must match ^[A-Za-z0-9][A-Za-z0-9_.-]{0,62}$ (max 63 chars). Label values must be <= 63 chars."
  }
}

variable "ssh_keys" {
  description = "List of SSH key IDs or names."
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for k in var.ssh_keys : length(trimspace(k)) > 0])
    error_message = "All `ssh_keys` entries must be non-empty strings."
  }
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

  validation {
    condition     = alltrue([for id in var.firewall_ids : id > 0])
    error_message = "All `firewall_ids` entries must be > 0."
  }
}

variable "placement_group_id" {
  description = "Placement group ID."
  type        = number
  default     = null

  validation {
    condition     = var.placement_group_id == null ? true : var.placement_group_id > 0
    error_message = "If set, `placement_group_id` must be > 0."
  }
}

variable "networks" {
  description = "List of networks to attach."
  type = list(object({
    network_id = optional(number)
    subnet_id  = optional(string)
    ip         = optional(string)
    alias_ips  = optional(list(string), [])
  }))
  default = []

  validation {
    condition = alltrue([
      for n in var.networks : (
        (try(n.network_id > 0, false) || try(length(trimspace(n.subnet_id)) > 0, false)) &&
        (try(n.ip, null) == null || can(cidrhost("${n.ip}/32", 0)) || can(cidrhost("${n.ip}/128", 0))) &&
        alltrue([for ip in try(n.alias_ips, []) : can(cidrhost("${ip}/32", 0)) || can(cidrhost("${ip}/128", 0))])
      )
    ])
    error_message = "Each network attachment must set `network_id` > 0 or a non-empty `subnet_id`. Optional `ip` and `alias_ips` must be valid IP addresses."
  }
}

variable "network" {
  description = "Networks attached inline on the server (hcloud_server network block), applied at creation. Do not combine with `networks` for the same network."
  type = list(object({
    network_id = optional(number)
    subnet_id  = optional(string)
    ip         = optional(string)
    alias_ips  = optional(list(string), [])
  }))
  default = []

  validation {
    condition = alltrue([
      for n in var.network : (
        (try(n.network_id > 0, false) || try(length(trimspace(n.subnet_id)) > 0, false)) &&
        (try(n.ip, null) == null || can(cidrhost("${n.ip}/32", 0)) || can(cidrhost("${n.ip}/128", 0))) &&
        alltrue([for ip in try(n.alias_ips, []) : can(cidrhost("${ip}/32", 0)) || can(cidrhost("${ip}/128", 0))])
      )
    ])
    error_message = "Each `network` entry must set `network_id` > 0 or a non-empty `subnet_id`. Optional `ip` and `alias_ips` must be valid IP addresses."
  }
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

  validation {
    condition = alltrue([
      for r in var.rdns : (
        (can(cidrhost("${r.ip_address}/32", 0)) || can(cidrhost("${r.ip_address}/128", 0))) &&
        length(trimspace(r.dns_ptr)) > 0
      )
    ])
    error_message = "`rdns` entries must have a valid `ip_address` and a non-empty `dns_ptr`."
  }
}

variable "iso" {
  description = "ID or name of an ISO image to mount on the server."
  type        = string
  default     = null

  validation {
    condition     = var.iso == null ? true : length(trimspace(var.iso)) > 0
    error_message = "If set, `iso` must be a non-empty string."
  }
}

variable "rescue" {
  description = "Rescue system to boot into (e.g., linux64)."
  type        = string
  default     = null

  validation {
    condition     = var.rescue == null ? true : length(trimspace(var.rescue)) > 0
    error_message = "If set, `rescue` must be a non-empty string."
  }
}

variable "ignore_remote_firewall_ids" {
  description = "Ignore firewalls attached to the server outside of this module (e.g., via hcloud_firewall_attachment)."
  type        = bool
  default     = false
}

variable "timeouts" {
  description = "Timeouts for the server (e.g., { create = \"30m\" })."
  type = object({
    create = optional(string)
  })
  default = null
}
