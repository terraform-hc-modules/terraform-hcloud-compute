variable "create" {
  description = "Whether to create the volume attachment."
  type        = bool
  default     = true
}

variable "server_id" {
  description = "Server ID to attach the volume to."
  type        = number

  validation {
    condition     = var.server_id > 0
    error_message = "The `server_id` value must be > 0."
  }
}

variable "volume_id" {
  description = "Volume ID to attach."
  type        = number

  validation {
    condition     = var.volume_id > 0
    error_message = "The `volume_id` value must be > 0."
  }
}

variable "automount" {
  description = "Automount the volume on the server."
  type        = bool
  default     = false
}
