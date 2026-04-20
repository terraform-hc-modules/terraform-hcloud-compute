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
}

variable "server_type" {
  description = "Server type."
  type        = string
  default     = "cx22"
}

variable "image" {
  description = "Image to use."
  type        = string
  default     = "ubuntu-24.04"
}

variable "location" {
  description = "Location."
  type        = string
  default     = "fsn1"
}

variable "labels" {
  description = "Labels to apply."
  type        = map(string)
  default     = {}
}

variable "ssh_keys" {
  description = "SSH key IDs or names."
  type        = list(string)
  default     = []
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
}

variable "networks" {
  description = "Networks to attach."
  type        = any
  default     = []
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
}

variable "public_key" {
  description = "Public key content."
  type        = string
  default     = ""
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
}

variable "volume_size" {
  description = "Size of the volume in GB."
  type        = number
  default     = 10
}

variable "volume_format" {
  description = "Format of the volume."
  type        = string
  default     = null
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
}

variable "placement_group_type" {
  description = "Type of the placement group."
  type        = string
  default     = "spread"
}
