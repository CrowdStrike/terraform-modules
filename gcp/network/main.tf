resource "google_compute_network" "vpc_network" {
  name                    = "${var.alias}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet_1" {
  name          = "${var.alias}-subnet-1"
  ip_cidr_range = var.subnet_cidr_1
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_subnet_2" {
  name          = "${var.alias}-subnet-2"
  ip_cidr_range = var.subnet_cidr_2
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_subnet_3" {
  name          = "${var.alias}-subnet-3"
  ip_cidr_range = var.subnet_cidr_3
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
