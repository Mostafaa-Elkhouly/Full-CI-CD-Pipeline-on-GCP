resource "google_compute_network" "vpc_network" {
  name                    = "proj-vpc"
  auto_create_subnetworks = false
}
