variable "create" {
  description = "Whether to create the placement group."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the placement group."
  type        = string
}

variable "type" {
  description = "Type of the placement group (spread)."
  type        = string
  default     = "spread"
}

variable "labels" {
  description = "Labels to apply to the placement group."
  type        = map(string)
  default     = {}
}
