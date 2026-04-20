variable "create" {
  description = "Whether to create the snapshot."
  type        = bool
  default     = true
}

variable "server_id" {
  description = "Server ID to create snapshot from."
  type        = number
}

variable "description" {
  description = "Description of the snapshot."
  type        = string
  default     = null
}

variable "labels" {
  description = "Labels to apply to the snapshot."
  type        = map(string)
  default     = {}
}
