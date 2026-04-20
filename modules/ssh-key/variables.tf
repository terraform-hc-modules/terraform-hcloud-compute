variable "create" {
  description = "Whether to create the SSH key."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the SSH key."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The `name` value must be a non-empty string."
  }
}

variable "public_key" {
  description = "The public key content."
  type        = string

  validation {
    condition     = !var.create || length(trimspace(var.public_key)) > 0
    error_message = "When `create` is true, `public_key` must be a non-empty string."
  }
}

variable "labels" {
  description = "Labels to apply to the SSH key."
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
