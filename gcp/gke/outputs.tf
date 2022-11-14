output "cluster-id" {
  description = "The ID for the GKE Cluster"
  value       = google_container_cluster.gke-cluster.id
}

output "cluster-self-link" {
  description = "The server-defined URL for the GKE Cluster."
  value       = google_container_cluster.gke-cluster.self_link
}

output "cluster-endpoint" {
  description = "The IP address of this cluster's Kubernetes master."
  value       = google_container_cluster.gke-cluster.endpoint
}

output "cluster-client-certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the cluster endpoint."
  value       = google_container_cluster.gke-cluster.master_auth.0.client_certificate
}

output "cluster-client-key" {
  description = "Base64 encoded private key used by clients to authenticate to the cluster endpoint."
  value       = google_container_cluster.gke-cluster.master_auth.0.client_key
}

output "cluster-ca-certificate" {
  description = "Base64 encoded public certificate that is the root certificate of the cluster."
  value       = google_container_cluster.gke-cluster.master_auth.0.cluster_ca_certificate
}

output "cluster-master-version" {
  description = "The current version of the master in the cluster. This may be different than the min_master_version set in the config if the master has been updated by GKE."
  value       = google_container_cluster.gke-cluster.master_version
}

output "nodepool-id" {
  description = "The ID for the GKE Node Pool"
  value       = google_container_node_pool.gke-nodes.id
}


output "nodepool-instance-group-urls" {
  description = "List of instance group URLs which have been assigned to this node pool."
  value       = google_container_node_pool.gke-nodes.instance_group_urls
}

output "nodepool-managed-instance-group-urls" {
  description = "The resource URLs of the managed instance groups associated with this node pool."
  value       = google_container_node_pool.gke-nodes.managed_instance_group_urls
}

output "gke-token" {
  description = "The token used to authenticate to the cluster."
  value       =  data.google_client_config.provider.access_token
}