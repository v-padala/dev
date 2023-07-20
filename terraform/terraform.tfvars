############## Variables for network creation #############
project_id     = ""

network_name   = ""

subnet1_name   = ""
region_1       = ""
subnet1_cidr   = "10.1.0.0/16"

subnet2_name   = ""
region_2       = ""
subnet2_cidr   = "10.2.0.0/16"

# Prefix used for the names of  network resorces created (Cloud nat and routers)
network-prefix = ""
#Gloabal variables
region = "us-central1"
zone = ""

#Database variables
sql_instance_name = 
database_version = 
sql_primary_zone = "a"
sql_secondary_zone = "b"
sql_db_disk_size = 2048
sql_default_db_name = 
sql_default_user_name = 
sql_default_user_password = 
maintenance_window_day          = "1"
maintenance_window_hour         = "23"
maintenance_window_update_track = "canary"
db_charset        = "UTF8"
db_collation      = "en_US.UTF8"
activation_policy = "ALWAYS"
availability_type = "REGIONAL"
disk_type         = "PD_SSD"
pricing_plan      = "PER_USE"
tier              = 
network_auto_create_subnetworks         = "false"
network_delete_default_routes_on_create = "false"
deletion_protection = "false"
#compute instance variables
instance_Name = 
host_machine_type = 
docker_host_image =
boot_disk_size = 
subnet_uri = 
serviceemail = 

