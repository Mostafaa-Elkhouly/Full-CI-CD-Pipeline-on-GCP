resource "google_compute_address" "static" {
  name = "ipv4-address"
  region = var.vm_region
}

resource "google_compute_instance" "management_vm" {
  name                      = "management-instancee"
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
    
    # to allow a public IP address
    access_config {
      nat_ip = google_compute_address.static.address
    } 
  }

  metadata_startup_script = file("./Compute/startup_script.sh")

  metadata = {
    ssh-keys = "mostafa_elkhouly97:${file("./Compute/id_rsa.pub")}"
  }

  service_account {
    email  = var.instance_sa_email
    scopes = ["cloud-platform"]
  }
}