resource "google_container_cluster" "gke_cluster" {
  name     = "${var.alias}-${var.cluster_name}"
  location = var.region
  
  # We only use separately managed node pools. 
  # So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_name
  subnetwork = var.subnet_name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "gke_nodes" {
  name       = "${var.alias}-gke-nodepool"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.alias
    }
    image_type = var.node_os
    machine_type = "n1-standard-1"
    tags         = ["${var.alias}-gke-node", "${var.alias}-gke-cluster"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

data "google_client_config" "provider" {}