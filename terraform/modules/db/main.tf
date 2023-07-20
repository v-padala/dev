locals {
  point_in_time_recovery_enabled = var.availability_type == "REGIONAL" ? true : lookup(var.backup_configuration, "point_in_time_recovery_enabled", true)
  backups_enabled                = var.availability_type == "REGIONAL" ? true : lookup(var.backup_configuration, "enabled", true)
  retained_backups = lookup(var.backup_configuration, "retained_backups", null)
  retention_unit   = lookup(var.backup_configuration, "retention_unit", null)
}
resource "random_id" "sql_instance" {
  keepers = {
    sql_instance_name= "${var.sql_instance_name}"
  }
  byte_length = 4
}
resource "google_sql_database_instance" "default" {
  project          = "${var.project_id}"
  name             = "${var.sql_instance_name}"
  database_version = "${var.database_version}"
  region           = "${var.region}"
  deletion_protection = false
  settings {
    tier                        = "${var.tier}"
    activation_policy           = "${var.activation_policy}"
    availability_type           = "${var.availability_type}"
    disk_autoresize = "${var.disk_autoresize}"
    disk_size       = "${var.disk_size}"
    disk_type       = "${var.disk_type}"
    pricing_plan    = "${var.pricing_plan}"
    user_labels     = "${var.user_labels}"
    ip_configuration {
      ipv4_enabled = false
      private_network = var.network_name
    }
    dynamic "backup_configuration" {
      for_each = [var.backup_configuration]
      content {
        binary_log_enabled             = false
        enabled                        = local.backups_enabled
        start_time                     = lookup(backup_configuration.value, "start_time", null)
        location                       = lookup(backup_configuration.value, "location", null)
        point_in_time_recovery_enabled = local.point_in_time_recovery_enabled
        transaction_log_retention_days = lookup(backup_configuration.value, "transaction_log_retention_days", null)
        dynamic "backup_retention_settings" {
          for_each = local.retained_backups != null || local.retention_unit != null ? [var.backup_configuration] : []
          content {
            retained_backups = local.retained_backups
            retention_unit   = local.retention_unit
          }
        }
      }
    }
    dynamic "database_flags" {
        iterator = flag
        for_each = "${var.database_flags}"
        content {
            name = flag.value.name
            value   = flag.value.value
        }
    }
    location_preference {
      zone = "${var.region}-${var.sql_primary_zone}"
      secondary_zone = "${var.region}-${var.sql_secondary_zone}"
    }
    maintenance_window {
      day          = "${var.maintenance_window_day}"
      hour         = "${var.maintenance_window_hour}"
      update_track = "${var.maintenance_window_update_track}"
    }
  }
}
# create Default database
resource "google_sql_database" "default" {
  name       = "${var.db_name}"
  project    = "${var.project_id}"
  instance   = "${google_sql_database_instance.default.name}"
  charset    = "${var.db_charset}"
  collation  = "${var.db_collation}"
  depends_on = [google_sql_database_instance.default]
}
# Create additional data bases 
resource "google_sql_database" "additional_databases" {
  count      = "${length(var.additional_databases)}"
  project    = "${var.project_id}"
  name       = "${lookup(var.additional_databases[count.index], "name")}"
  charset    = "${lookup(var.additional_databases[count.index], "charset", "")}"
  collation  = "${lookup(var.additional_databases[count.index], "collation", "")}"
  instance   = "${google_sql_database_instance.default.name}"
  depends_on = [google_sql_database_instance.default]
}
# prepare for creation of passwor
resource "random_id" "user-password" {
  keepers = {
    name = "${google_sql_database_instance.default.name}"
  }
  byte_length = 8
  depends_on  = [google_sql_database_instance.default]
}
# Create Default user
resource "google_sql_user" "default" {
  name       = "${var.user_name}"
  project    = "${var.project_id}"
  instance   = "${google_sql_database_instance.default.name}"
  password   = "${var.user_password}"
  depends_on = [google_sql_database_instance.default]
}
# create Aditional users
resource "google_sql_user" "additional_users" {
  count      = "${length(var.additional_users)}"
  project    = "${var.project_id}"
  name       = "${lookup(var.additional_users[count.index], "name")}"
  password   = "${var.user_password}"
  instance   = "${google_sql_database_instance.default.name}"
  depends_on = [google_sql_database_instance.default]
}
