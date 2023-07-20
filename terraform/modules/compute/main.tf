resource "google_compute_address" "static" {
  name = "ipv4-address"
}
resource "google_compute_instance" "instance" {
  name         = "var.name-${random_string.vm_name.result}"
  project      = var.project
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["allow-ssh"]
  labels       = var.labels
  allow_stopping_for_update = var.allow_stopping_for_update
  boot_disk {
    auto_delete = var.boot_disk_auto_delete
    initialize_params {
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    subnetwork = var.subnetwork
    subnetwork_project =  var.subnetwork_project
        access_config {
    nat_ip = google_compute_address.static.address
    }
  }
  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }
  
}
resource "random_string" "vm_name" {
  length           = 4
  special          = true
  override_special = "/@£$"
}

