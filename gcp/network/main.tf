resource "google_compute_network" "vpc-network" {
  name = "${var.alias}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc-private-subnet-1" {
  name          = "${var.alias}-private-subnet-1"
  ip_cidr_range = var.private-subnet-cidr-1
  region        = var.region
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "vpc-private-subnet-2" {
  name          = "${var.alias}-private-subnet-2"
  ip_cidr_range = var.private-subnet-cidr-2
  region        = var.region
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "vpc-private-subnet-3" {
  name          = "${var.alias}-private-subnet-3"
  ip_cidr_range = var.private-subnet-cidr-3
  region        = var.region
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "vpc-public-subnet-1" {
  name          = "${var.alias}-public-subnet-1"
  ip_cidr_range = var.public-subnet-cidr-1
  region        = var.region
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "vpc-public-subnet-2" {
  name          = "${var.alias}-public-subnet-2"
  ip_cidr_range = var.public-subnet-cidr-2
  region        = var.region
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "vpc-public-subnet-3" {
  name          = "${var.alias}-public-subnet-3"
  ip_cidr_range = var.public-subnet-cidr-3
  region        = var.region
  network       = google_compute_network.vpc-network.id
}