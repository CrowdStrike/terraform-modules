output "network_name" {
  description = "The Name of the Network"
  value       = google_compute_network.vpc_network.name
}

output "subnet_1_name" {
  description = "The Name of Subnet 1"
  value       = google_compute_subnetwork.vpc_subnet_1.name
}
output "subnet_2_name" {
  description = "The Name of Subnet 2"
  value       = google_compute_subnetwork.vpc_subnet_2.name
}
output "subnet_3_name" {
  description = "The Name of Subnet 3"
  value       = google_compute_subnetwork.vpc_subnet_3.name
}