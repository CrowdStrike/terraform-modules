resource "google_compute_network" "vpc_network" {
  name = "${var.alias}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_private_subnet_1" {
  name          = "${var.alias}-private-subnet-1"
  ip_cidr_range = var.private_subnet_cidr_1
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_private_subnet_2" {
  name          = "${var.alias}-private-subnet-2"
  ip_cidr_range = var.private_subnet_cidr_2
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_private_subnet_3" {
  name          = "${var.alias}-private-subnet-3"
  ip_cidr_range = var.private_subnet_cidr_3
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_public_subnet_1" {
  name          = "${var.alias}-public-subnet-1"
  ip_cidr_range = var.public_subnet_cidr_1
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_public_subnet_2" {
  name          = "${var.alias}-public-subnet-2"
  ip_cidr_range = var.public_subnet_cidr_2
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "vpc_public_subnet_3" {
  name          = "${var.alias}-public-subnet-3"
  ip_cidr_range = var.public_subnet_cidr_3
  region        = var.region
  network       = google_compute_network.vpc_network.id
}