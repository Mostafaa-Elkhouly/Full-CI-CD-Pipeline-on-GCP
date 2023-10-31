resource "google_compute_instance" "management_vm" {
  name                      = "management-instance"
  machine_type              = "e2-medium"
  zone                      = "${var.vm_region}-b"
  tags                      = ["management-vm"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.vpc_network_name
    subnetwork = var.vm_subnet
    #remove access_config {} to prevent a public IP address
  }

  metadata_startup_script = file("./Compute/startup_script.sh")

  service_account {
    email  = var.instance_sa_email
    scopes = ["cloud-platform"]
  }
}