
locals {
  endpoint = one(google_container_cluster.gke_cluster[*].endpoint)
  endpoint_auto = one(google_container_cluster.gke_cluster_autopilot[*].endpoint)
  endpoint_out = local.endpoint != null ? local.endpoint : local.endpoint_auto

  cluster_ca_cert = one(google_container_cluster.gke_cluster[*].master_auth.0.cluster_ca_certificate)
  cluster_ca_cert_auto = one(google_container_cluster.gke_cluster_autopilot[*].master_auth.0.cluster_ca_certificate)
  cluster_ca_cert_out = local.cluster_ca_cert != null ? local.cluster_ca_cert : local.cluster_ca_cert_auto
}

output "cluster_endpoint" {
  description = "The IP address of this cluster's Kubernetes master."
  value       = local.endpoint_out
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root certificate of the cluster."
  value       = local.cluster_ca_cert_out
}

output "gke_token" {
  description = "The token used to authenticate to the cluster."
  value       =  data.google_client_config.provider.access_token
}