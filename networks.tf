resource "google_compute_network" "default" {
  name                    = "default"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "default-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.google_region
  network       = google_compute_network.default.id
}
