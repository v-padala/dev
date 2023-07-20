
variable "project" {
  description = "The project ID to manage the Compute Instance resources"
  type        = string
}

variable "zone" {
  description = "The zone for the Compute Instance resources"
  type        = string
}

variable "name" {
  description = "The name of the Compute Instance resources."
  type        = string
}

variable "machine_type" {
  description = "The machine type to create."
  type        = string
}
variable "tags" {
  description = "A list of network tags to attach to the instance."
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "A map of key/value label pairs to assign to the instance."
  type        = map(string)
  default     = {}
}

variable "allow_stopping_for_update" {
  description = "If true, allows Terraform to stop the instance to update its properties."
  type        = bool
  default     = true
}

variable "boot_disk_auto_delete" {
  description = "Whether the disk will be auto-deleted when the instance is deleted."
  type        = bool
  default     = true
}

variable "boot_disk_device_name" {
  description = "Name with which attached boot disk will be accessible."
  type        = string
  default     = null
  //TODO default     = "bootdisk"
}

variable "boot_disk_size" {
  description = "The size of the boot disk in gigabytes."
  type        = number
  default     = null
}

variable "boot_disk_type" {
  description = "The GCE disk type for the boot disk."
  type        = string
  default     = null
}

variable "boot_disk_image" {
  description = "The image from which to initialize the boot disk."
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork to attach to the instance."
  type = string
}

variable "subnetwork_project" {
  description = "Subnetwork project to attach to the instance."
  type = string
  default     = null
}

variable "service_account_email" {
  description = "The service account e-mail address."
  type        = string
  #default     = null
}

variable "service_account_scopes" {
  description = "A list of service scopes."
  type        = list(string)
  #default     = []
}

variable "ip_addr" {
}
