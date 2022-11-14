output "network_name" {
  description = "The Name of the Network"
  value       = google_compute_network.vpc_network.name
}

output "private_subnet_1_name" {
  description = "The Name of Private Subnet 1"
  value       = google_compute_subnetwork.vpc_private_subnet_1.name
}
output "private_subnet_2_name" {
  description = "The Name of Private Subnet 2"
  value       = google_compute_subnetwork.vpc_private_subnet_2.name
}
output "private_subnet_3_name" {
  description = "The Name of Private Subnet 3"
  value       = google_compute_subnetwork.vpc_private_subnet_3.name
}
output "public_subnet_1_name" {
  description = "The Name of Public Subnet 1"
  value       = google_compute_subnetwork.vpc_public_subnet_1.name
}
output "public_subnet_2_name" {
  description = "The Name of Public Subnet 2"
  value       = google_compute_subnetwork.vpc_public_subnet_2.name
}
output "puyblic_subnet_3_name" {
  description = "The Name of Public Subnet 3"
  value       = google_compute_subnetwork.vpc_public_subnet_3.name
}

output "private_subnet_1_cidr" {
  description = "The CIDR of Private Subnet 1"
  value       = google_compute_subnetwork.vpc_private_subnet_1.ip_cidr_range
}
output "private_subnet_2_cidr" {
  description = "The CIDR of Private Subnet 2"
  value       = google_compute_subnetwork.vpc_private_subnet_2.ip_cidr_range
}
output "private_subnet_3_cidr" {
  description = "The CIDR of Private Subnet 3"
  value       = google_compute_subnetwork.vpc_private_subnet_3.ip_cidr_range
}
output "public_subnet_1_cidr" {
  description = "The CIDR of Public Subnet 1"
  value       = google_compute_subnetwork.vpc_public_subnet_1.ip_cidr_range
}
output "public_subnet_2_cidr" {
  description = "The CIDR of Public Subnet 2"
  value       = google_compute_subnetwork.vpc_public_subnet_2.ip_cidr_range
}
output "puyblic_subnet_3_cidr" {
  description = "The CIDR of Public Subnet 3"
  value       = google_compute_subnetwork.vpc_public_subnet_3.ip_cidr_range
}