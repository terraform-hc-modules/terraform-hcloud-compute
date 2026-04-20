################################################################################
# Server
################################################################################

variable "create_server" {
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
  description = "Server type."
  type        = string
  default     = "cx22"

  validation {
    condition     = length(trimspace(var.server_type)) > 0
    error_message = "The `server_type` value must be a non-empty string (for example, cx22)."
  }
}

variable "image" {
  description = "Image to use."
  type        = string
  default     = "ubuntu-24.04"

  validation {
    condition     = length(trimspace(var.image)) > 0
    error_message = "The `image` value must be a non-empty string."
  }
}

variable "location" {
  description = "Location."
  type        = string
  default     = "fsn1"

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "The `location` value must be a non-empty string (for example, fsn1)."
  }
}

variable "labels" {
  description = "Labels to apply."
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
  description = "SSH key IDs or names."
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
  description = "Firewall IDs to attach."
  type        = list(number)
  default     = []

  validation {
    condition     = alltrue([for id in var.firewall_ids : id > 0])
    error_message = "All `firewall_ids` entries must be > 0."
  }
}

variable "networks" {
  description = "Networks to attach."
  type = list(object({
    network_id = number
    ip         = optional(string)
    alias_ips  = optional(list(string), [])
  }))
  default = []

  validation {
    condition = alltrue([
      for n in var.networks : (
        n.network_id > 0 &&
        (try(n.ip, null) == null || can(cidrhost("${n.ip}/32", 0)) || can(cidrhost("${n.ip}/128", 0))) &&
        alltrue([for ip in try(n.alias_ips, []) : can(cidrhost("${ip}/32", 0)) || can(cidrhost("${ip}/128", 0))])
      )
    ])
    error_message = "Each network attachment must set `network_id` > 0. Optional `ip` and `alias_ips` must be valid IP addresses."
  }
}

variable "backups" {
  description = "Enable backups."
  type        = bool
  default     = false
}

################################################################################
# SSH Key
################################################################################

variable "create_ssh_key" {
  description = "Whether to create an SSH key."
  type        = bool
  default     = false
}

variable "ssh_key_name" {
  description = "Name of the SSH key."
  type        = string
  default     = null

  validation {
    condition     = var.ssh_key_name == null || length(trimspace(var.ssh_key_name)) > 0
    error_message = "If set, `ssh_key_name` must be a non-empty string."
  }
}

variable "public_key" {
  description = "Public key content."
  type        = string
  default     = ""

  validation {
    condition     = !var.create_ssh_key || length(trimspace(var.public_key)) > 0
    error_message = "When `create_ssh_key` is true, `public_key` must be a non-empty string."
  }
}

################################################################################
# Volume
################################################################################

variable "create_volume" {
  description = "Whether to create a volume."
  type        = bool
  default     = false
}

variable "volume_name" {
  description = "Name of the volume."
  type        = string
  default     = null

  validation {
    condition     = var.volume_name == null || length(trimspace(var.volume_name)) > 0
    error_message = "If set, `volume_name` must be a non-empty string."
  }
}

variable "volume_size" {
  description = "Size of the volume in GB."
  type        = number
  default     = 10

  validation {
    condition     = var.volume_size >= 10
    error_message = "The `volume_size` value must be >= 10 (GB)."
  }
}

variable "volume_format" {
  description = "Format of the volume."
  type        = string
  default     = null

  validation {
    condition     = var.volume_format == null || contains(["ext4", "xfs"], var.volume_format)
    error_message = "If set, `volume_format` must be one of: ext4, xfs."
  }
}

variable "volume_automount" {
  description = "Automount the volume."
  type        = bool
  default     = false
}

################################################################################
# Placement Group
################################################################################

variable "create_placement_group" {
  description = "Whether to create a placement group."
  type        = bool
  default     = false
}

variable "placement_group_name" {
  description = "Name of the placement group."
  type        = string
  default     = null

  validation {
    condition     = var.placement_group_name == null || length(trimspace(var.placement_group_name)) > 0
    error_message = "If set, `placement_group_name` must be a non-empty string."
  }
}

variable "placement_group_type" {
  description = "Type of the placement group."
  type        = string
  default     = "spread"

  validation {
    condition     = contains(["spread"], var.placement_group_type)
    error_message = "The `placement_group_type` value must be \"spread\"."
  }
}
