variable "project_id" {
  default = ""
}

###### Primary and secondary regions for  network ######
variable "region_1" {
  default = ""
}

variable "region_2" {
  default = ""
}

################### Network and Subnets ##################
variable "network_name" {
}

variable "subnet1_name" {
}

variable "subnet2_name" {
}

variable "subnet1_cidr" {
  default = ""
}

variable "subnet2_cidr" {
  default = ""
}

variable "private_ip_google_access" {
  default = true
}

variable "network-prefix" {
  default = "thd"
}
variable "zone" {
type        = string
}
variable "network_name" {}
variable "network_auto_create_subnetworks" {}
variable "network_delete_default_routes_on_create" {}
variable "sql_instance_name" {}
variable "database_version" {}
variable "sql_primary_zone" {}
variable "sql_secondary_zone" {}
variable "sql_db_disk_size" {}
variable "sql_default_db_name" {}
variable "sql_default_user_name" {}
variable "sql_default_user_password" {}
variable "maintenance_window_day" {}
variable "maintenance_window_hour" {}
variable "maintenance_window_update_track" {}
variable "db_charset" {}
variable "db_collation" {}
variable "activation_policy" {}
variable "availability_type" {}
variable "disk_type" {}
variable "pricing_plan" {}
variable "tier" {}
variable "instance_Name" {
type        = string
}
variable "host_machine_type" {
type        = string
}
variable "docker_host_image" {
type        = string
}
variable "boot_disk_size" {
type        = string
}
variable "subnet_uri" {
type        = string
}
variable "serviceemail" {
type        = string
}