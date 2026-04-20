variable "create" {
  description = "Whether to create the volume."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the volume."
  type        = string
}

variable "size" {
  description = "Size of the volume in GB."
  type        = number
  default     = 10
}

variable "location" {
  description = "Location of the volume."
  type        = string
  default     = "fsn1"
}

variable "labels" {
  description = "Labels to apply to the volume."
  type        = map(string)
  default     = {}
}

variable "server_id" {
  description = "Server ID to attach the volume to."
  type        = number
  default     = null
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
}

variable "delete_protection" {
  description = "Enable delete protection."
  type        = bool
  default     = false
}
