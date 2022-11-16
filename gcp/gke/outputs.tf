output "cluster_id" {
  description = "The ID for the GKE Cluster"
  value       = one(google_container_cluster.gke_cluster[*].id)
}

output "cluster_self_link" {
  description = "The server_defined URL for the GKE Cluster."
  value       = one(google_container_cluster.gke_cluster[*].self_link)
}


locals {
endpoint = one(google_container_cluster.gke_cluster[*].endpoint)
endpoint_auto = one(google_container_cluster.gke_cluster_autopilot[*].endpoint)
endpoint_out = local.endpoint != null ? local.endpoint : local.endpoint_auto

cluster_ca_cert = one(google_container_cluster.gke_cluster[*].cluster_ca_certificate)
cluster_ca_cert_auto = one(google_container_cluster.gke_cluster_autopilot[*].master_auth.0.cluster_ca_certificate)
cluster_ca_cert_out = local.cluster_ca_cert != null ? local.cluster_ca_cert : local.cluster_ca_cert_auto
}

output "cluster_endpoint" {
  description = "The IP address of this cluster's Kubernetes master."
  value       = local.endpoint_out
}

output "cluster_client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the cluster endpoint."
  value       = one(google_container_cluster.gke_cluster[*].master_auth.0.client_certificate)
}

output "cluster_client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the cluster endpoint."
  value       = one(google_container_cluster.gke_cluster[*].master_auth.0.client_key)
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root certificate of the cluster."
  value       = local.cluster_ca_cert_out
}

output "cluster_master_version" {
  description = "The current version of the master in the cluster. This may be different than the min_master_version set in the config if the master has been updated by GKE."
  value       = one(google_container_cluster.gke_cluster[*].master_version)
}

output "nodepool_id" {
  description = "The ID for the GKE Node Pool"
  value       = one(google_container_node_pool.gke_nodes[*].id)
}


output "nodepool_instance_group_urls" {
  description = "List of instance group URLs which have been assigned to this node pool."
  value       = one(google_container_node_pool.gke_nodes[*].instance_group_urls)
}

output "nodepool_managed_instance_group_urls" {
  description = "The resource URLs of the managed instance groups associated with this node pool."
  value       = one(google_container_node_pool.gke_nodes[*].managed_instance_group_urls)
}

output "gke_token" {
  description = "The token used to authenticate to the cluster."
  value       =  data.google_client_config.provider.access_token
}