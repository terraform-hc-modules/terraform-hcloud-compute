variable "create" {
  description = "Whether to create the snapshot."
  type        = bool
  default     = true
}

variable "server_id" {
  description = "Server ID to create snapshot from."
  type        = number

  validation {
    condition     = var.server_id > 0
    error_message = "The `server_id` value must be > 0."
  }
}

variable "description" {
  description = "Description of the snapshot."
  type        = string
  default     = null

  validation {
    condition     = var.description == null || length(trimspace(var.description)) > 0
    error_message = "If set, `description` must be a non-empty string."
  }
}

variable "labels" {
  description = "Labels to apply to the snapshot."
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
