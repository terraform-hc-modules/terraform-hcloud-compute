variable "create" {
  description = "Whether to create the volume."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the volume."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The `name` value must be a non-empty string."
  }
}

variable "size" {
  description = "Size of the volume in GB."
  type        = number
  default     = 10

  validation {
    condition     = var.size >= 10
    error_message = "The `size` value must be >= 10 (GB)."
  }
}

variable "location" {
  description = "Location of the volume."
  type        = string
  default     = "fsn1"

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "The `location` value must be a non-empty string."
  }
}

variable "labels" {
  description = "Labels to apply to the volume."
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

variable "server_id" {
  description = "Server ID to attach the volume to."
  type        = number
  default     = null

  validation {
    condition     = var.server_id == null || var.server_id > 0
    error_message = "If set, `server_id` must be > 0."
  }
}

variable "automount" {
  description = "Automount the volume."
  type        = bool
  default     = false
}

variable "format" {
  description = "Format of the volume (ext4 or xfs)."
  type        = string
  default     = null

  validation {
    condition     = var.format == null || contains(["ext4", "xfs"], var.format)
    error_message = "If set, `format` must be one of: ext4, xfs."
  }
}

variable "delete_protection" {
  description = "Enable delete protection."
  type        = bool
  default     = false
}
