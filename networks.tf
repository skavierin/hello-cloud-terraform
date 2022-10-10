
# resource "google_compute_network" "vpc_network" {
#   name                    = "general-network"
#   auto_create_subnetworks = false
#   mtu                     = 1460
# }

# resource "google_compute_subnetwork" "default" {
#   name          = "general-subnet"
#   ip_cidr_range = "10.10.0.0/24"
#   region        = "europe-north1"
#   network       = google_compute_network.vpc_network.id
# }
