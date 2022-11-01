provider "kubernetes" {
  host                   = var.endpoint
  client_certificate     = var.client-cert
  client_key             = var.client-key
  cluster_ca_certificate = var.ca-cert
}