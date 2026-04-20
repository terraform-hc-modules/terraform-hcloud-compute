variable "create" {
  description = "Whether to create the SSH key."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the SSH key."
  type        = string
}

variable "public_key" {
  description = "The public key content."
  type        = string
}

variable "labels" {
  description = "Labels to apply to the SSH key."
  type        = map(string)
  default     = {}
}
