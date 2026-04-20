variable "create" {
  description = "Whether to create the placement group."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the placement group."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The `name` value must be a non-empty string."
  }
}

variable "type" {
  description = "Type of the placement group (spread)."
  type        = string
  default     = "spread"

  validation {
    condition     = contains(["spread"], var.type)
    error_message = "The `type` value must be \"spread\"."
  }
}

variable "labels" {
  description = "Labels to apply to the placement group."
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
