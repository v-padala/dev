
variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources"
}

variable "sql_instance_name" {
  description = "The name of the Cloud SQL resources"
}

// required
variable "database_version" {
  description = "The database version to use"
}

// required
variable "region" {
  description = "The region of the Cloud SQL resources"
  default     = "europe-north1"
}

variable "tier" {
  description = "The tier for the master instance."
  default     = "db-f1-micro"
}
variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings"
  type = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    enabled                        = false
    start_time                     = null
    location                       = null
    point_in_time_recovery_enabled = false
    transaction_log_retention_days = null
    retained_backups               = null
    retention_unit                 = null
  }
}
variable "sql_primary_zone" {
  description = "The zone for the master instance, it should be something like: `a`, `c`."
}
variable "sql_secondary_zone" {
  description = "The zone for the master instance, it should be something like: `a`, `c`."
}

variable "activation_policy" {
  description = "The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  default     = "ALWAYS"
}

variable "availability_type" {
  description = "The availability type for the master instance.This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`."
  default     = "ZONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size."
  default     = true
}

variable "disk_size" {
  description = "The disk size for the master instance."
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  default     = "PER_USE"
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  default     = 23
}

variable "maintenance_window_update_track" {
  description = "The update track of maintenance window for the master instance maintenance.Can be either `canary` or `stable`."
  default     = "canary"
}

variable "database_flags" {
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/mysql/flags)"
  default     = []
}

variable "user_labels" {
  description = "The key/value labels for the master instances."
  default     = {}
}

variable "authorized_gae_applications" {
  description = "The authorized gae applications for the Cloud SQL instances"
  default     = []
}

variable "ip_configuration" {
  description = "The ip configuration for the master instances."

  default = [
    {
      ipv4_enabled = "false"
      require_ssl = "false"
    }
  ]
}


variable "db_name" {
  description = "The name of the default database to create"
  default     = "default"
}

variable "db_charset" {
  description = "The charset for the default database"
  default     = ""
}

variable "db_collation" {
  description = "The collation for the default database. Example: 'en_US.UTF8'"
  default     = ""
}

variable "additional_databases" {
  description = "A list of databases to be created in your cluster"
  default     = []
}

variable "user_name" {
  description = "The name of the default user"
  default     = "default"
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  default     = ""
}

variable "additional_users" {
  description = "A list of users to be created in your cluster"
  default     = []
}

variable create_timeout {
  description = "The optional timout that is applied to limit long database creates."
  default     = "10m"
}

variable update_timeout {
  description = "The optional timout that is applied to limit long database updates."
  default     = "10m"
}

variable delete_timeout {
  description = "The optional timout that is applied to limit long database deletes."
  default     = "10m"
}

variable network_name {}

