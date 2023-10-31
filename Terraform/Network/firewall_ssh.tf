# Create an http data source to makes an HTTP GET request to the given URL
data "http" "my_public_ip" {
  url = "https://ipinfo.io/ip"
}

# allow SSH connection from my external IP address only
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${data.http.my_public_ip.response_body}/32"]
  target_tags = ["management-vm"]
}